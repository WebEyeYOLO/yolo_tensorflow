#!/bin/bash
if [ "$1" = "sh" ];then
    exec /bin/sh
elif [ "$1" = "bash" ];then
    exec /bin/bash
elif [ "$1" = "version" ];then
    echo $RELEASE_DESC
else
    exec python test.py --weights YOLO_small.ckpt
fi