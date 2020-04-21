FROM nvidia/cuda

ARG PYTHON_VERSION=3.7
ARG WITH_TORCHVISION=1

# Install some basic utilities
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    sudo \
    git \
    bzip2 \
    libx11-6 \
    unzip \
    wget \
    python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

# get code
RUN git clone https://github.com/MatanAvitan/openpifpaf.git

# get data
  RUN mkdir openpifpaf/datasets && \
  mkdir openpifpaf/datasets/data-mscoco && \
  cd openpifpaf/datasets/data-mscoco && \
  wget http://images.cocodataset.org/annotations/annotations_trainval2017.zip && \
  unzip annotations_trainval2017.zip && \
  wget http://images.cocodataset.org/annotations/image_info_test2017.zip && \
  unzip image_info_test2017.zip && \
  mkdir images && cd images &&
  wget http://images.cocodataset.org/zips/val2017.zip && \
  unzip val2017.zip && \
  wget http://images.cocodataset.org/zips/train2017.zip && \
  unzip train2017.zip

# make output dir
RUN mkdir openpifpaf/outputs

# First copy only the requirement.txt, so changes in other files won't trigger
# a full pip reinstall

RUN cd openpifpaf && python3 setup.py install && \
    pip3 install pycocotools matplotlib

CMD cd openpifpaf && time CUDA_VISIBLE_DEVICES=0,1,2,3 python3 -m openpifpaf.train --lr=1e-3  --momentum=0.95  --epochs=7  --lr-decay 120 140   --batch-size=16 --basenet=resnet101   --head-quad=1 --headnets pif paf paf25   --square-edge=401   --lambdas 10 1 1 15 1 1 15 1 1 --loader-workers=16 --pre-n-images=1 --n-images=1
