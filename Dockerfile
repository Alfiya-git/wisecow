FROM debian:bullseye

# Install dependencies (prerequisites)
RUN apt-get update && apt-get install -y \
    fortune \
    cowsay \
    netcat \
 && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy the script
COPY wisecow.sh .

# Make it executable
RUN chmod +x wisecow.sh

# Expose the port Wisecow uses
EXPOSE 4499

# Run the app
CMD ["./wisecow.sh"]
