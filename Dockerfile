FROM conda/miniconda3

USER root
ENV PYOPENGL_PLATFORM='egl'

WORKDIR /
COPY workspace /workspace
RUN apt install -y libgl1-mesa-glx ffmpeg libsm6 libxext6 freeglut3-dev && apt update



WORKDIR /workspace/acronym
RUN conda env create -f /workspace/contact_graspnet/contact_graspnet_env.yml
RUN conda init && echo "conda activate contact_graspnet_env" >> ~/.bashrc
SHELL ["/bin/bash", "--login", "-c"]
RUN pip install -r requirements.txt && python -m pip install -e .
