# FROM nvidia/opengl:1.0-glvnd-devel-ubuntu18.04 as glvnd
FROM conda/miniconda3

USER root

# ENV PYOPENGL_PLATFORM='egl'
WORKDIR /workspace

COPY sources.list /etc/apt/
COPY contact_graspnet_env.yml contact_graspnet_env.yml
# COPY --from=glvnd /usr/share/glvnd/egl_vendor.d/10_nvidia.json /usr/share/glvnd/egl_vendor.d/10_nvidia.json
RUN apt-get update && apt-get install -y --allow-unauthenticated --no-install-recommends \
    libglvnd0 \
    libgl1 \
    libglx0 \
    libegl1 \
    libgles2 \
    mesa-utils \
    freeglut3-dev \
    ffmpeg \
    libxext6 \
    libsm6 \
    && rm -rf /var/lib/apt/lists/*


COPY entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh

ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES all


RUN conda env create -f contact_graspnet_env.yml
RUN conda init && echo "conda activate contact_graspnet_env" >> ~/.bashrc && echo "python -m pip install -e /workspace/acronym" >>~/.bashrc


# SHELL ["/bin/bash", "--login", "-c"]
# RUN python -m pip install -e .