# esp-docker-micropython
building micropython/pycopy for esp8266/esp32 in Docker

based on knowledge of

https://github.com/pfalcon/    and    

https://github.com/fcollova/micropython-docker-build

## Usage

```
$ docker build -t pycopy_8266 - < ./Dockerfile_pycopy_8266
$ docker create --name pycopy8266 pycopy_8266:latest
$ docker cp pycopy8266:/pycopy/ports/esp8266/build-GENERIC/firmware-combined.bin ./firmware_esp8266_pycopy.bin
```
