# 使用 Ubuntu 作为基础镜像
FROM ubuntu:20.04

# 避免交互式前端
ENV DEBIAN_FRONTEND=noninteractive

# 安装必要的工具
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    bash \
    && rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /root

# 下载并解压 netdisk-fast-download
RUN wget -O netdisk-fast-download.zip https://github.com/qaiu/netdisk-fast-download/releases/download/0.1.7-release-fixed3/netdisk-fast-download-bin-fixed3.zip \
    && unzip netdisk-fast-download.zip \
    && rm netdisk-fast-download.zip

# 进入 netdisk-fast-download 目录
WORKDIR /root/netdisk-fast-download

# # 运行安装脚本
# RUN bash service-install.sh

# 设置容器启动命令
CMD ["./service-install.sh"]
