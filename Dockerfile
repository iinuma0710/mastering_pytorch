FROM nvidia/cuda:11.3.0-cudnn8-devel-ubuntu20.04

# 環境変数の設定
ENV TZ=Asia/Tokyo
ENV DEBIAN_FRONTEND=noninteractive

# 必要なパッケージのインストール
COPY requirements.txt /tmp/
RUN apt-get update && \
    apt-get install -y python3 python3-pip openjdk-11-jdk && \
    pip3 install -r /tmp/requirements.txt -f https://download.pytorch.org/whl/cu113/torch_stable.html

# Jupyter の設定
RUN jupyter notebook --generate-config && \
    sed -i -e "s/#c.NotebookApp.ip = 'localhost'/c.NotebookApp.ip = '0.0.0.0'/" /root/.jupyter/jupyter_notebook_config.py && \
    sed -i -e "s/#c.NotebookApp.allow_remote_access = False/c.NotebookApp.allow_remote_access = True/" /root/.jupyter/jupyter_notebook_config.py

# 作業ディレクトリの設定
WORKDIR /workspace
COPY . /workspace/

# ポートの解放
EXPOSE 8888