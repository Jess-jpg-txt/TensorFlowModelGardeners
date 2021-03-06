import cv2
import datetime
import colorsys
import numpy as np
import time

import threading as t 
from queue import Queue

import tensorflow as tf
import tensorflow.keras as ks
import tensorflow.keras.backend as K

from yolo.utils.testing_utils import support_windows, prep_gpu, build_model, draw_box, int_scale_boxes, gen_colors, get_coco_names

class FastVideo(object):
    """
    program for faster object detection in TensorFlow. Algorithm was tested on RTX 2070 Super with Intel Core i5-4500k CPU. The first 2-3 seconds of 
    the video diplayed may be too fast or too slow as the algorithem is designed to converge to the most optimal FPS based on the input source. This also 
    may only be noticeable on webcam input. Think of it as configuration time, or the set up time. This algorithem requires GPU to work correctly. 

    using a default model:
        cap = BufferVideo("test.mp4", model = "regular", process_width=416, process_height=416)
        cap.run()
    
    using a non-default model:
        prep_gpu()
        with tf.device("/GPU:0"):
            model = build_model(name = "regular", w = 416, h = 416) 
        cap = BufferVideo(0, model = model, process_width=416, process_height=416)
        cap.run()


    Args: 
        file_name: a string for the video file you would like tensorflow to process, or an integer for the webcam youd would like to use 
        model: a string in {"regular", "tiny", "spp"} for the yolo model you would like to use. if None, regular will be used as defualt. 
               if a non standard model is used, you may also pass in a regular keras model, but the implemented error checking is not garunteed to function 
        preprocess_function: python function to preprocess images input into the model, if none out default preprocessing function is used 
        process_width: the integer width that the model should reshape the input to prior to input, 416 by default
        process_height: the integer height that the model should reshape the input to prior to input, 416 by default 
        classes: integer number of possible classes that could be predicted, if none is provided, 80 will be used as the default from the COCO dataset
        labels: a List[string] of the name of the class associated with each neural net prediction, if nothing is provided, the default COCO labels will be used 
        preprocess_with_gpu: boolean for wether you would like to do the pre processing on the gpu or cpu. some devices lack the memory capability to 
                             run 2 piplines on one graphics device, so the default is set to the CPU, but the program could work faster by using the GPU, 
                             by about 2 to 3 fps at high resolutions (1080p or higher)
        gpu_device: string for the device you would like to use to run the model, if the model you pass in is not standard make sure you prep 
                    the model on the same device that you pass in, by default /GPU:0
        preprocess_gpu: the gpu device you would like to use to preprocess the image if you have multiple. by default use the first /GPU:0

    Raises: 
        IOError: the video file you would like to use is not found 
        Exception: the model you input is a string and is not in the list of supported models

    """
    def __init__(self, file_name, model = "regular", preprocess_function = None, process_width = 416, process_height = 416, classes = 80, labels = None, preprocess_with_gpu = False, gpu_device = "/GPU:0", preprocess_gpu = "/GPU:0"):
        self._cap = cv2.VideoCapture(file_name)
        if not self._cap.isOpened():
            raise IOError("video file was not found")

        #support for ANSI cahracters in windows    
        support_windows()
        
        self._file = file_name
        self._fps = 120
        
        # fast but as close to one 2 one as possible
        if file_name == 0:
            self._batch_size = 5 # 40 fps more conistent frame to frame
        else:
            # faster but more potential for delay from input to output
            self._batch_size = 9 # 45 fps faster but less frame to frame consistent, it will remain consistant, but there is opertunity for more frames to be loaded than
        
            if process_width > 416 or process_height > 416:
                self._batch_size = 3

        self._gpu_device = gpu_device
        if preprocess_with_gpu:
            self._pre_process_device = preprocess_gpu
        else:
            self._pre_process_device = "/CPU:0"
        
        self._preprocess_function = preprocess_function
        self._width = int(self._cap.get(3))
        self._height = int(self._cap.get(4))
        self._classes = classes
        self._model = model
        self._p_width = process_width
        self._p_height = process_height

        self._colors = gen_colors(self._classes)
        
        if labels == None:
            self._labels = get_coco_names(path = "yolo/dataloaders/dataset_specs/coco.names")
        else:
            self._labels = labels

        self._load_que = Queue(self._batch_size * 5)
        self._display_que = Queue(self._batch_size)
        self._running = True
        self._wait_time = 0.01

        self._read_fps = 1
        self._display_fps = 1
        self._latency = None
        self._batch_proc = 1
        self._frames = 0
        self._obj_detected = 0
        return

    def _load_model(self, model):
        if (type(model) == type(None)):
            prep_gpu()
            with tf.device(self._gpu_device):
                model = build_model(name = "regular", w = self._p_width, h = self._p_height) 
            return model
        default_set = {"regular", "tiny", "spp"} 
        if (type(model) == str and model in default_set):
            print(model)
            prep_gpu()
            with tf.device(self._gpu_device):
                model = build_model(name = model, w = self._p_width, h = self._p_height) 
            return model
        elif (type(model) == str):
            raise Exception("unsupported default model")
        
        # a model object passed in
        return model
    
    def _preprocess(self, image):
        # flip the image to make it mirror if you are using a webcam
        if type(self._file) == int:
            image = tf.image.flip_left_right(image)
        image = tf.cast(image, dtype = tf.float32)
        image = image/255
        return image

    def read(self, lock = None):
        """ read video frames in a thread """
        # init the starting variables to calculate FPS 
        start = time.time()
        l = 0
        tick = 0
        timeout = 0 
        process_device = self._pre_process_device
        
        if self._preprocess_function == None:
            preprocess = self._preprocess
        else:
            preprocess = self._preprocess_function

        while (self._cap.isOpened() and self._running):
            # wait for que to get some space, if waiting too long, error occured and return
            while self._load_que.full() and self._running:
                timeout += 1
                time.sleep(self._wait_time * 5)
                if not self._running:
                    return
                if timeout >= self._fps: 
                    print("[EXIT] an error has occured, frames are not being pulled from que")
                    return 
            if not self._running:
                return

            # with the CPU load and process an image
            timeout = 0
            success, image = self._cap.read()
            with tf.device(process_device):
                e = datetime.datetime.now()
                image = preprocess(image)
                # then dump the image on the que
                self._load_que.put(image)
                f = datetime.datetime.now()

            # compute the reading FPS
            l += 1
            if time.time() - start - tick >= 1:
                tick += 1
                #store the reading FPS so it can be printed clearly
                self._read_fps = l
                l = 0
            # sleep for default 0.01 seconds, to allow other functions the time to catch up or keep pace 
            time.sleep(self._wait_time)
        return

    def display(self):
        """ 
        display the processed images in a thread, for models expected output format see tf.image.combined_non_max_suppression
        https://www.tensorflow.org/api_docs/python/tf/image/combined_non_max_suppression
        """
        # init the starting variables to calculate FPS 
        start = time.time()
        l = 0
        tick = 0
        while (self._cap.isOpened() and self._running):
            # if the display que is empty, nothing has been processed, just wait for an image to arrive 
            # do not timeout ever as too long does not garuntee an error
            while self._display_que.empty() and self._running:
                time.sleep(self._wait_time)
                if not self._running:
                    return
            if not self._running:
                return

            # get the images, the predictions placed on the que via the run function (the model)    
            image, boxes, classes, conf = self._display_que.get()
            
            # there is potential for the images to be processed in batches, so for each image in the batch draw the boxes and the predictions and the confidence 
            for i in range(image.shape[0]):
                self._obj_detected = draw_box(image[i], boxes[i], classes[i], conf[i], self._colors, self._labels)
                #display the frame then wait in case something else needs to catch up 
                cv2.imshow("frame", image[i])
                time.sleep(self._wait_time)

                #compute the display fps
                l += 1
                if time.time() - start - tick >= 1:
                    tick += 1
                    # store the fps to diplayed to the user
                    self._display_fps = l
                    l = 0
                if cv2.waitKey(1) & 0xFF == ord('q') or not self._running:
                    break
        return
        
    def run(self):
        # init the model
        model = self._load_model(self._model) 
        gpu_device = self._gpu_device
        
        # print processing information
        print(f"capture (width, height): ({self._width},{self._height})")
        print(f"Yolo Possible classes: {self._classes}")
        

        if self._preprocess_function == None:
            preprocess = self._preprocess
        else:
            preprocess = self._preprocess_function

        # get one frame and put it inthe process que to get the process started 
        if self._cap.isOpened():
            success, image = self._cap.read()
            with tf.device(self._pre_process_device):
                e = datetime.datetime.now()
                image = preprocess(image)
                self._load_que.put(image)
                f = datetime.datetime.now()
        else:
            return

        # start a thread to load frames 
        load_thread = t.Thread(target=self.read, args=())
        load_thread.start()

        # start a thread to display frames 
        display_thread = t.Thread(target=self.display, args=())
        display_thread.start()

        try:
            # while the captue is open start processing frames
            while (self._cap.isOpened()):
                # in case the load que has many frames in it, load one batch 
                proc = []
                for i in range(self._batch_size):
                    if self._load_que.empty():
                        break
                    value = self._load_que.get()
                    proc.append(value)
                    # for debugging
                    # we can watch it catch up to real time
                    # print(len(self._load_que.queue), end= " ")
                
                # if the que was empty the model is ahead, and take abreak to let the other threads catch up 
                if len(proc) == 0:
                    time.sleep(self._wait_time)
                    continue
                    #print()

                # log time and process the batch loaded in the for loop above
                a = datetime.datetime.now()
                with tf.device(self._gpu_device):
                    image = tf.convert_to_tensor(proc)
                    pimage = tf.image.resize(image, (self._p_width, self._p_height))
                    pred = model.predict(pimage)
                    boxes, classes = int_scale_boxes(pred[0], pred[1], self._width, self._height)
                b = datetime.datetime.now()
                
                # computation latency to see how much delay between input and output
                if self._frames >= 1000:
                    self._frames = 0
                    self._latency = None
                
                # compute the latency
                if self._latency != None:
                    self._latency += (b - a)
                else:
                    self._latency = (b - a)
                
                # compute the number of frames processed, used to compute the moving average of latency
                self._frames += image.shape[0]
                self._batch_proc = image.shape[0]
                timeout = 0
                
                # if the display que is full, do not put anything, just wait for a ms
                while self._display_que.full() and not self._running:
                    time.sleep(self._wait_time)

                # put processed frames on the display que
                self._display_que.put((image.numpy(), boxes.numpy(), classes.numpy(), pred[2]))

                #print everything
                self.print_opt()

            # join the laoding thread and diplay thread      
            load_thread.join()
            display_thread.join()

            # close the video capture and destroy all open windows
            self._cap.release()
            cv2.destroyAllWindows()
        except KeyboardInterrupt:
            # arbitrary keyboard input 
            print("\n\n\n")
            self._running = False

            # join the laoding thread and diplay thread   
            load_thread.join()
            display_thread.join()

            # close the video capture and destroy all open windows
            self._cap.release()
            cv2.destroyAllWindows()
        return
    
    def print_opt(self):
        #make everything print pretty using ANSI
        print(f"                                \rlatency:, \033[1;32;40m{self._latency/self._frames * 1000} \033[0m ms", end = "\n")
        print("                                 \rread fps: \033[1;34;40m%d\033[0m " % (self._read_fps), end = "\n")
        print("                                 \rdisplay fps: \033[1;34;40m%d\033[0m" % (self._display_fps), end = "\n")
        print("                                 \rbatch processed: \033[1;37;40m%d\033[0m" % (self._batch_proc), end = "\n")
        print("                                 \robjects seen: \033[1;37;40m%d\033[0m" % (self._obj_detected), end = "\n")
        print("\033[F\033[F\033[F\033[F\033[F\033[F", end="\n")
        return



if __name__ == "__main__":
    cap = FastVideo("test2.mp4", model = "regular", process_width=416, process_height=416, preprocess_with_gpu=False)
    cap.run()
