# Mastering PyTorch を読む
Packt 出版の [Mastering PyTorch](https://www.packtpub.com/product/mastering-pytorch/9781789614381) を読んで PyTorch と深層学習をマスターします．

## 環境構築
ハードウェアの構成：

```
CPU: AMD Ryzen 9 3950X
GPU: NVIDIA RTX3090 GDDR6X 24GB
MEM: DDR4-3200 64GB
OS: Ubuntu 20.04
```

[NVIDIA のダウンロードページ](https://developer.nvidia.com/cuda-downloads)から CUDA Toolkit をインストールする．

```bash
$ wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
$ sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
$ wget https://developer.download.nvidia.com/compute/cuda/11.5.0/local_installers/cuda-repo-ubuntu2004-11-5-local_11.5.0-495.29.05-1_amd64.deb
$ sudo dpkg -i cuda-repo-ubuntu2004-11-5-local_11.5.0-495.29.05-1_amd64.deb
$ sudo apt-key add /var/cuda-repo-ubuntu2004-11-5-local/7fa2af80.pub
$ sudo apt-get update
$ sudo apt-get -y install cuda
```

[NVIDIA Container Toolkit](https://github.com/NVIDIA/nvidia-docker) を導入する．

```bash
$ distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
$ curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
$ curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
$ sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
$ sudo systemctl restart docker
```

Docker で仮想環境を立ち上げる．

```bash
# イメージの作成
$ docker build -t mastering_pytorch_env ./

# コンテナの起動
$ docker run -it -p 8888:8888 mastering_pytorch_env /bin/bash
```

Docker 内で Jupyter Notebook を起動する．
```bash
$ jupyter notebook --allow-root --ip=0.0.0.0
```