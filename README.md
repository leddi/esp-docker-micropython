# esp-docker-micropython
building micropython/pycopy for esp8266/esp32 in Docker

based on knowledge of pfalcon

## Usage
docker build -t pycopy_8266 -f ./Dockerfile_pycopy_8266

docker create pycopy_8266 --name pycopy_container

docker cp pycopy_container:/pycopy/ports/esp8266/build-GENERIC/firmware-combined.bin ./firmware_esp8266_pycopy.bin

