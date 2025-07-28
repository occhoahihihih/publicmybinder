FROM python:3.11-slim

# Cài Jupyter và tiện ích hệ thống
RUN apt-get update && apt-get install -y \
    curl git neofetch sudo && \
    pip install notebook && \
    useradd -ms /bin/bash user && \
    echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Mặc định vào thư mục user
WORKDIR /home/user
USER root

# Mở Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
