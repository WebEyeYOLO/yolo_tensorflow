#!/usr/bin/env bash
set -o errexit
BASEDIR="$( cd "$( dirname "$0"  )" && pwd  )"

cd $BASEDIR
mkdir -p yolov1detection/data
cp -a ../yolo ../utils ../test.py yolov1detection
cp -a ../data/weights yolov1detection/data
tar zcvf yolov1detection.tar.gz yolov1detection
mv yolov1detection.tar.gz ./docker/test/
cd ./docker/test/
docker build -t yolov1detection:1.0-gpu .
rm -rf ./docker/test/yolov1detection.tar.gz
rm -rf $BASEDIR/yolov1detection
echo "build finish image name is yolov1detection:1.0-gpu"