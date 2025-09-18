FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    bash \
    coreutils \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . /app

RUN chmod -R 777 /app

EXPOSE 4499

CMD ["./wisecow.sh"]
