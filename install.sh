#! /usr/bin/env sh

apt update 
apt upgrade -y

apt install git openjdk-14-jdk libopencv-dev python3 python3-pip python3-xlib build-essential cmake pycodestyle -y

apt install libtesseract-dev tesseract-ocr-deu tesseract-ocr-eng -y

