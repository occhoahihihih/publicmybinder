FROM alpine

# Cài git, bash, và các công cụ cần thiết
RUN apk add --no-cache git bash

# Clone repo neofetch
RUN git clone https://github.com/dylanaraps/neofetch

# Vào thư mục neofetch và chạy
WORKDIR /neofetch

# Đặt script entrypoint khi container start
ENTRYPOINT ["bash", "neofetch"]
