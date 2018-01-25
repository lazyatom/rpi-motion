FROM resin/raspberry-pi-python:3
# FROM resin/raspberry-pi-python:3-onbuild

RUN [ "cross-build-start" ]

RUN apt-get update
RUN apt-get install -y --no-install-recommends motion
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /mnt/motion && \
    chown motion /mnt/motion

COPY motion.conf /etc/motion/motion.conf

EXPOSE 8081
ENTRYPOINT ["motion"]

RUN [ "cross-build-end" ]
