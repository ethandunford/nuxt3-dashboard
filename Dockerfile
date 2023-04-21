FROM node:16.17.0-buster-slim
RUN apt-get update -y && apt-get install -y libpng-dev autoconf libtool nasm python3 build-essential g++
WORKDIR /home/node/app