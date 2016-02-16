# Docker images for the Beaglebone black

## Build

```bash
docker build -t beaglebone-ros .
```

## Run on Ubuntu

Install qemu
```bash
sudo apt-get install qemu-user-static
```

Run a shell inside the container
```bash
docker run -it --rm -v /usr/bin/qemu-arm-static:/usr/bin/qemu-arm-static beaglebone-ros bash
```
