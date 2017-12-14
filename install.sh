#!/bin/bash

apt-get update

tools=(build-essential cmake curl libgtk2.0-dev pkg-config libv4l-dev libavcodec-dev libavformat-dev libswscale-dev python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev ant software-properties-common python-software-properties debconf-utils)

apt-get install -y ${tools[@]}

add-apt-repository -y ppa:webupd8team/java

echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
apt-get install -y oracle-java8-installer

rm -rf /var/lib/apt/lists/*
rm -rf /var/cache/oracle-jdk8-installer

export JAVA_HOME=/usr/lib/jvm/java-8-oracle

export ANT_HOME=/usr/bin/ant

curl -sL https://github.com/Itseez/opencv/archive/3.3.1.tar.gz | tar xvz -C /tmp

cd /tmp/opencv-3.3.1 && mkdir build && cd build

cmake -D BUILD_SHARED_LIBS=OFF ..
make -j8

mkdir /opencv-java-bin
cp bin/opencv-331.jar lib/libopencv_java331.so /opencv-java-bin/
cp lib/libopencv_java331.so /usr/lib/x86_64-linux-gnu/

mkdir /docker-data
