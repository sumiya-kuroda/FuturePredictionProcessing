FROM nvidia/cuda:12.0.0-devel-ubuntu20.04
LABEL maintainer="Sumiya Kuroda"
LABEL project="FPP"

ARG DEBIAN_FRONTEND=noninteractive

COPY . /app

RUN apt-get update && \
    apt-get install python3 python3-pip ffmpeg libsm6 libxext6 nvidia-cuda-toolkit -y  && \
    cd /app && \
    python3 -m pip install --no-cache-dir --upgrade pip && \
    pip install -r requirements.txt