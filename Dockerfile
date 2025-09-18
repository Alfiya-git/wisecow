FROM ubuntu:20.04

# Avoid interactive prompts during apt-get
#ENV DEBIAN_FRONTEND=noninteractive

# Install prerequisites: cowsay, fortune, netcat
RUN apt-get update && apt-get install -y \
    cowsay \
    fortune \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/* 

# Add /usr/games to PATH (where cowsay/fortune live)
ENV PATH="$PATH:/usr/games"
   
# Set working directory
WORKDIR /app

# Copy project files
COPY . /app

# Ensure permissions
RUN chmod +x /app/wisecow.sh

# Expose server port
EXPOSE 4499

# Run script
CMD ["./wisecow.sh"]
