# FROM nvidia/opengl:1.0-glvnd-devel-ubuntu18.04 as glvnd
# FROM conda/miniconda3
# FROM tensorflow/tensorflow:2.6.0-gpu
# FROM ubuntu:18.04
# FROM nvidia/cuda:11.4.1-cudnn8-runtime-ubuntu20.04
FROM nvidia/cuda:11.4.1-cudnn8-devel-ubuntu20.04

USER root

# ENV PYOPENGL_PLATFORM='egl'
# WORKDIR /workspace

# COPY sources.list /etc/apt/
WORKDIR /home/juancm
COPY contact_graspnet_env.yml contact_graspnet_env.yml
COPY miniconda.sh miniconda.sh
COPY entrypoint.sh /entrypoint.sh

# COPY --from=glvnd /usr/share/glvnd/egl_vendor.d/10_nvidia.json /usr/share/glvnd/egl_vendor.d/10_nvidia.json
RUN apt-get update && apt-get install -y --allow-unauthenticated --no-install-recommends \
    # libglvnd0 \
    # libgl1 \
    # libglx0 \
    # libegl1 \
    # libgles2 \
    # mesa-utils \
    # freeglut3-dev \
    # ffmpeg \
    # libxext6 \
    # libsm6 \
    # wget \
    # software-properties-common \
    && rm -rf /var/lib/apt/lists/*


RUN chmod 777 /entrypoint.sh

ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES all

# install cuda and cudnn
# wget https://developer.download.nvidia.com/compute/cuda/11.2.0/local_installers/cuda_11.2.0_460.27.04_linux.run
# chmod +x cuda_11.2.0_460.27.04_linux.run
# sh cuda_11.2.0_460.27.04_linux.run --silent --toolkit

# ARG OS=ubuntu1804
# RUN wget https://developer.download.nvidia.com/compute/cuda/repos/${OS}/x86_64/cuda-${OS}.pin 
# RUN mv cuda-${OS}.pin /etc/apt/preferences.d/cuda-repository-pin-600
# RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/${OS}/x86_64/7fa2af80.pub
# RUN add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/${OS}/x86_64/ /"
# RUN conda update -y && apt-get update

# ARG cudnn_version=8.1.0.77
# ARG cuda_version=cuda11.2
# RUN apt-get install libcudnn8=${cudnn_version}-1+${cuda_version}
# RUN apt-get install libcudnn8-dev=${cudnn_version}-1+${cuda_version}

RUN chmod 777 /home/juancm/miniconda.sh && /home/juancm/miniconda.sh -b -p

ENV PATH=$PATH:/root/miniconda3/bin
RUN conda init && conda env create -f contact_graspnet_env.yml
RUN conda init && echo "conda activate contact_graspnet_env" >> ~/.bashrc && echo "python -m pip install -e /home/juancm/acronym" >> ~/.bashrc

ARG CUDA_VER='cuda-11.4'
ENV LD_LIBRARY_PATH=/usr/local/${CUDA_VER}/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
ENV PATH=/usr/local/${CUDA_VER}/bin${PATH:+:${PATH}}

# SHELL ["/bin/bash", "--login", "-c"]
# RUN python -m pip install -e .
