FROM resin/raspberry-pi-python:3
# FROM resin/raspberry-pi-python:3-onbuild

RUN apt-get update && apt-get install -y --no-install-recommends motion && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /mnt/motion && \
    chown motion /mnt/motion

COPY motion.conf /etc/motion/motion.conf

EXPOSE 8081
ENTRYPOINT ["motion"]
