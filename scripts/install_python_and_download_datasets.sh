#! /bin/bash
mkdir github;
cd github ; git clone https://github.com/MatanAvitan/openpifpaf.git
cd openpifpaf;
sudo apt install python3;
sudo apt-get install python3-setuptools;
sudo apt-get update && sudo apt install python3-pip;
sudo python3 setup.py install;
sudo pip3 install pycocotools matplotlib;
sudo apt-get install freeglut3 freeglut3-dev libxi-dev libxmu-dev;
mkdir openpifpaf/outputs;
mkdir datasets; cd datasets;
mkdir "data-mscoco";
cd "data-mscoco";
wget http://images.cocodataset.org/annotations/annotations_trainval2017.zip;
sudo apt install unzip;
unzip annotations_trainval2017.zip;
wget http://images.cocodataset.org/annotations/image_info_test2017.zip;
unzip image_info_test2017.zip;
mkdir images; cd images;
wget http://images.cocodataset.org/zips/val2017.zip;
unzip val2017.zip;
wget http://images.cocodataset.org/zips/train2017.zip;
unzip train2017.zip;
cd ~;
wget http://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda_10.2.89_440.33.01_linux.run;
sudo sh cuda_10.2.89_440.33.01_linux.run;
