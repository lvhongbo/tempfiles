# 使用带有CUDA 12.6支持的NVIDIA CUDA基础镜像
# FROM nvidia/cuda:12.6.0-base-ubuntu20.04
# FROM nvidia/cuda:12.6.0-cudnn8-runtime-ubuntu20.04
FROM nvidia/cuda:v1

# 设置工作目录
WORKDIR /app

# 备份原有的软件源配置文件
#RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak

# 使用阿里云镜像源
# RUN echo "deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse" > /etc/apt/sources.list && \
#     echo "deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse" >> /etc/apt/sources.list && \
#     echo "deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse" >> /etc/apt/sources.list && \
#     echo "deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse" >> /etc/apt/sources.list


# echo "deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse" > /etc/apt/sources.list
# echo "deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse" >> /etc/apt/sources.list
# echo "deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse" >> /etc/apt/sources.list
# echo "deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse" >> /etc/apt/sources.list



# 安装必要的工具，包括curl
RUN apt-get update && \
    apt-get install -y software-properties-common curl libglib2.0-0 libsm6 libxrender1 libxext6 && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update

# 安装libgl1-mesa-glx,OpenCV需要这个库
RUN apt-get update && \
    apt-get install -y libgl1-mesa-glx

RUN apt-get update && \
    apt-get install -y python3.12 python3.12-dev

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3.12 get-pip.py

# 将python3.12命令链接为python3
RUN rm -f /usr/bin/python3 &&\
    ln -s /usr/bin/python3.12 /usr/bin/python3

# 安装PyTorch带有GPU支持（适配CUDA 12.6），使用阿里云镜像源
RUN python3 -m pip install -i https://mirrors.aliyun.com/pypi/simple/ torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/nightly/cu121

# 安装其他库，使用阿里云镜像源
RUN python3 -m pip install -i https://mirrors.aliyun.com/pypi/simple/ numpy opencv-python pydantic fastapi uvicorn requests




# 创建/model-server目录
RUN mkdir -p /model-server

# 可选：将您的应用文件复制到容器中
# COPY your_application_files /app

# 可选：暴露UVicorn的端口
# EXPOSE 8000

# 可选：设置启动命令
# CMD ["uvicorn", "your_application_module:app", "--host", "0.0.0.0", "--port", "8000"]

# docker run -it --gpus all -p 8000:8000 -v /path/to/your/model:/model-server model_server:latest
