# Stage 1: Build the final image
FROM alpine:latest

# Label the image
LABEL maintainer="sarony11@gmail.com"

# Update and install basic tools
RUN apk update && apk upgrade && apk add --no-cache \
    bash \
    curl \
    tcpdump \
    nmap \
    bind-tools \
    net-tools \
    strace \
    git \
    jq \
    vim \
    htop \
    wget \
    unzip \
    python3 \
    py3-pip

# Install Kubernetes CLI
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

# Clean up
RUN rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

# Set the entry point to bash
ENTRYPOINT ["tail", "-f", "/dev/null"]
