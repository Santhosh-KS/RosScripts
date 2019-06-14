#!/bin/sh

sudo apt-get remove x264 libx264-dev
sudo apt-get install build-essential checkinstall cmake pkg-config yasm -y
sudo apt-get install git gfortran -y
sudo apt-get install libjpeg8-dev libjasper-dev libpng12-dev libjpeg62 -y
 

# If you are using Ubuntu 16.04
sudo apt-get install libtiff5-dev -y
 
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev -y
sudo apt-get install libxine2-dev libv4l-dev -y
sudo apt-get install libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev -y
sudo apt-get install qt5-default libgtk2.0-dev libtbb-dev -y
sudo apt-get install libatlas-base-dev -y
sudo apt-get install libfaac-dev libmp3lame-dev libtheora-dev -y
sudo apt-get install libvorbis-dev libxvidcore-dev -y
sudo apt-get install libopencore-amrnb-dev libopencore-amrwb-dev -y
sudo apt-get install x264 v4l-utils -y



git clone https://github.com/opencv/opencv.git
cd opencv 
git checkout 3.3.1 
cd ..

git clone https://github.com/opencv/opencv_contrib.git
cd opencv_contrib
git checkout 3.3.1
cd ..

cd opencv
mkdir build
cd build

cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_C_EXAMPLES=ON \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D WITH_TBB=ON \
      -D WITH_V4L=ON \
      -D WITH_QT=ON \
      -D WITH_OPENGL=ON \
      -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
      -D BUILD_EXAMPLES=ON ..

nproc
# substitute 4 by output of nproc
make -j8
sudo make install
