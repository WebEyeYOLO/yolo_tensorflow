## YOLO_tensorflow

Tensorflow implementation of [YOLO](https://arxiv.org/pdf/1506.02640.pdf)


### 一、容器化部署


1、构建test镜像
```bash
cd release
bash release.sh

#生产的镜像默认名字为yolov1detection:1.0-gpu
```


2、部署容器

```bash
docker run -d   -v /data/objectDetection/images:/run/images -v /data/yolo_tensorflow/result:/run/result_path  yolov1detection:1.0-gpu 

#部署容器需要挂载两个目录到容器中，一个为图片获取路径，另一个为结果json保存路径
```

3、基本原理

test.py 将不断检测images文件夹中的图片，一旦有图片便会进行检测，检测完毕生产json结果文件保存到result_path路径，并且删除已处理的图片


### 二、普通安装与训练

1. Clone yolo_tensorflow repository
	```Shell
	$ git clone https://github.com/hizhangp/yolo_tensorflow.git
    $ cd yolo_tensorflow
	```

2. Download Pascal VOC dataset, and create correct directories
	```Shell
	$ ./download_data.sh
	```

3. Download [YOLO_small](https://drive.google.com/file/d/0B5aC8pI-akZUNVFZMmhmcVRpbTA/view?usp=sharing)
weight file and put it in `data/weight`

4. Modify configuration in `yolo/config.py`

5. Training
	```Shell
	$ python train.py
	```

6. Test
	```Shell
	$ python test.py
	```

### 三、普通安装依赖
1. Tensorflow

2. OpenCV

如果使用容器，已打包再基础镜像
