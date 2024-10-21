# Use Ubuntu latest version as the base image
FROM ubuntu:latest

# Prevent interactive prompts during build
ENV DEBIAN_FRONTEND=noninteractive

# Update and install necessary packages
RUN apt-get update && apt-get install -y \
    openssh-server \
    sudo \
    passwd

# Create a user for SSH access
ARG USERNAME=ctfuser
ARG PASSWORD=CTFpassword123

RUN useradd -m -s /bin/bash $USERNAME && \
    echo "$USERNAME:$PASSWORD" | chpasswd && \
    usermod -aG sudo $USERNAME

# Configure SSH
RUN mkdir /var/run/sshd && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config

# Allow SSH to run on port 22
EXPOSE 22

# Start SSH service when the container starts
CMD ["/usr/sbin/sshd", "-D"]
