# 使用带有CUDA 12.6支持的NVIDIA CUDA基础镜像
FROM nvidia/cuda:12.6.0-base-ubuntu20.04

# 设置工作目录
WORKDIR /app

# 安装Python 3.12和pip
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.12 python3.12-dev && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3.12 get-pip.py

# 将python3.12命令链接为python3
RUN ln -s /usr/bin/python3.12 /usr/bin/python3

# 安装PyTorch带有GPU支持（适配CUDA 12.6）
RUN python3 -m pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/nightly/cu121

# 安装其他库
RUN python3 -m pip install numpy opencv-python pydantic fastapi uvicorn requests

# 创建/model-server目录
RUN mkdir -p /model-server

# 可选：将您的应用文件复制到容器中
# COPY your_application_files /app

# 可选：暴露UVicorn的端口
# EXPOSE 8000

# 可选：设置启动命令
# CMD ["uvicorn", "your_application_module:app", "--host", "0.0.0.0", "--port", "8000"]
