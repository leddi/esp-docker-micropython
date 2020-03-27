# esp-docker-micropython
building micropython/pycopy for esp8266/esp32 in Docker

based on knowledge of

https://github.com/pfalcon/    and    

https://github.com/fcollova/micropython-docker-build

## Usage

$ docker build -t pycopy_8266 - < ./Dockerfile_pycopy_8266
$ docker create --name pycopy8266 pycopy_8266:latest
$ docker cp pycopy8266:/pycopy/ports/esp8266/build-GENERIC/firmware-combined.bin ./firmware_esp8266_pycopy.bin

# esp8266
$ python -m esptool --port /dev/ttyUSB0 --chip 8266 erase_flash
$ python -m esptool --port /dev/ttyUSB0 --chip 8266 write_flash --verify --flash_size=8m 0 firmware_.bin

## esp32  
    docker build -t pycopy_32 - < ./Dockerfile_pycopy_esp32  
    docker create --name pycopy_esp32 pycopy_32:latest
    docker cp pycopy_esp32:/esp/pycopy/ports/esp32/build/firmware.bin firmware.bin
    python -m esptool --port /dev/ttyUSB0 --chip esp32 erase_flash  
    python -m esptool --port /dev/ttyUSB0 --chip esp32 write_flash --verify -z 0x1000 firmware_.bin`
