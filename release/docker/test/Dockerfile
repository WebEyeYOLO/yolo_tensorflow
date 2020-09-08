FROM zhichaoyan/tensorflow-opencv:1.15.0-gpu

ADD yolov1detection.tar.gz /run
ADD entrypoint.sh /run
WORKDIR /run/yolov1detection

ENTRYPOINT ["sh","/run/entrypoint.sh"]

