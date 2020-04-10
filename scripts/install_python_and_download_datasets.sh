#! /bin/bash
mkdir github;
cd github ; git clone https://github.com/MatanAvitan/openpifpaf.git
cd openpifpaf;
sudo apt install python3;
python3 setup.py install;
pip3 install pycocotools;
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

