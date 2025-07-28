FROM alpine

# Cài đặt git và bash
RUN apk add --no-cache git bash

# Clone neofetch và chạy luôn
RUN git clone https://github.com/dylanaraps/neofetch /opt/neofetch && \
    cd /opt/neofetch && \
    ./neofetch
