# 使用包含 JDK 17 的基础镜像
FROM bellsoft/liberica-openjdk-alpine:17

# 安装必要的包
RUN apk add --no-cache wget unzip dos2unix

# 设置工作目录
WORKDIR /app

# 下载最新的发布版本
ARG DOWNLOAD_URL=https://github.com/qaiu/netdisk-fast-download/releases/download/0.1.7-release-fixed3/netdisk-fast-download-bin-fixed3.zip
RUN wget -O netdisk-fast-download.zip $DOWNLOAD_URL && \
    unzip netdisk-fast-download.zip && \
    rm netdisk-fast-download.zip

# 确保执行权限，并修正可能的Windows换行符问题
RUN chmod +x /app/netdisk-fast-download/run.sh && \
    dos2unix /app/netdisk-fast-download/run.sh

# 查看run.sh的首行
RUN head -n 1 /app/netdisk-fast-download/run.sh

# 暴露应用所需的端口，根据应用实际端口调整
EXPOSE 8080

# 配置容器启动命令
CMD ["/app/netdisk-fast-download/run.sh"]
