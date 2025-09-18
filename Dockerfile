FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies: fortune + cowsay + nc
RUN apt-get update && \
    apt-get install -y --no-install-recommends fortune-mod cowsay netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY wisecow.sh /app/wisecow.sh
RUN chmod +x /app/wisecow.sh

EXPOSE 4499

# Run as non-root
RUN useradd -m appuser
USER appuser

CMD ["/app/wisecow.sh"]
