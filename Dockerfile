FROM nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04
LABEL maintainer="Sumiya Kuroda"
LABEL project="FPP"

ARG DEBIAN_FRONTEND=noninteractive

COPY . /app

RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub
RUN apt-get update && \
    apt-get install python3 python3-pip ffmpeg -y  && \
    cd /app && \
    python3 -m pip install --no-cache-dir --upgrade pip && \
    pip install -r requirements.txt

CMD ["/bin/bash"]