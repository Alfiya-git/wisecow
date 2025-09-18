FROM ubuntu:20.04

# Avoid interactive prompts during apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Install prerequisites: cowsay, fortune, netcat
RUN apt-get update && apt-get install -y \
    bash \
    coreutils \
    cowsay \
    fortune-mod \
    netcat \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy project files
COPY . /app

# Ensure permissions
RUN chmod -R 755 /app

# Expose server port
EXPOSE 4499

# Run script
CMD ["./wisecow.sh"]
