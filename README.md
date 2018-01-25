# RPi-Motion

[![Docker Automated build](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/arunderwood/rpi-motion)

[![Docker Build Status](https://img.shields.io/docker/build/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/arunderwood/rpi-motion)

This runs a motion-detecting camera connected to a Raspberry Pi. The videos are saved into a folder on the host machine (i.e. outside of the Docker container), and can be streamed over the network too.


## Building the image

    docker build . -t arunderwood/rpi-motion


## Running

If you're happy with the defaults, you can pull the latest docker image and run it:

    ./run.sh

This will connect to a webcam via `/dev/video0` and start running as a docker daemon.

## Bootstrapping a Pi

* Write a Raspbian image to your SD card

* Mount the *Boot* volume of the SD card

  Create a file named `wpa_supplicant.conf`

  Paste this into the .conf file and fill in your network details

    ```
country=US
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
    ssid="<your network name>"
    psk="<your password>"
}
    ```

  Create an empty file named `ssh` to enable SSH

* Plug the SD card into your Pi and power on

* SSH into the Pi
  * *Username*: pi
  * *Password*: raspberry

* Change the password

  `passwd`

* Install git

  `sudo apt update && sudo apt install -y git`

* Clone this repo and run the bootstrap script

  ```
  git clone https://github.com/arunderwood/rpi-motion.git
  cd rpi-motion
  sudo chmod +x bootstrap.sh
  sudo bootstrap.sh
  ```
