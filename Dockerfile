FROM alpine

# Cài đặt các công cụ cần thiết
RUN apk add --no-cache curl nodejs npm bash coreutils grep

# Cài đặt code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Cài đặt ngrok
RUN npm install -g ngrok

# Thiết lập ngrok authtoken
RUN ngrok config add-authtoken 2tEx6KjA194d2NCfq4kP1BvxD7r_4X3W1XpjczMLfZDctmcsk

# Khởi động code-server và ngrok, lấy public URL, sau đó đếm ngược 30 ngày
RUN code-server --bind-addr 0.0.0.0:8080 --auth none & \
    ngrok http 8080 > /dev/null & \
    sleep 5 && \
    public_url=$(curl -s http://127.0.0.1:4040/api/tunnels | grep -o 'https://[^"]*') && \
    echo "Public URL của ngrok: $public_url" && \
    total_seconds=2592000 && \
    while [ $total_seconds -gt 0 ]; do \
        hours=$((total_seconds / 3600)); \
        minutes=$(( (total_seconds % 3600) / 60 )); \
        seconds=$((total_seconds % 60)); \
        printf "Thời gian còn lại: %02d giờ %02d phút %02d giây\n" $hours $minutes $seconds; \
        sleep 1; \
        total_seconds=$((total_seconds - 1)); \
    done
