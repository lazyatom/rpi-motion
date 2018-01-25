FROM resin/rpi-raspbian:latest

RUN apt-get update && apt-get upgrade && apt-get install motion
RUN mkdir /mnt/motion && chown motion /mnt/motion
COPY motion.conf /etc/motion/motion.conf

EXPOSE 8081
ENTRYPOINT ["motion"]
