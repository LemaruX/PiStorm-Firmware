# PiStorm Firmware

This is a bundle of all current, original, and experimental/test PiStorm firmwares. Just run the relevant flash command to flash the required firmware.

**UPDATE - OpenOCD is no longer required. We now have a dedicated PiStorm flash tool**

## Instructions

**Prerequisites**
- An SD card containing PiOS Lite (available [here](https://www.raspberrypi.com/software/)).
- Either a keyboard and screen connected to the Pi, or WiFi and SSH enabled in PiOS and a tool to access it (for example PuTTY or KiTTY).

Boot the Pi from the SD card containing PiOS Lite, and login to the Pi when prompted.

Clone the repository:
`git clone https://github.com/LemaruX/PiStorm-Firmware`

CD into the PiStorm-Firmware directory:
`cd PiStorm-Firmware`

You can now run the required firmware update with with the relevant command listed below, this will automatically detect your CPLD version and flash appropriately. **(Do not use sudo to run the flash scripts).**

If successful "CPLD flashed successfully!" will be displayed. If it failed to flash the CPLD then an error message or "Could not detect CPLD." will be displayed. 

## Included Firmware


| Command | Description |
| ----------- | ----------- |
| ./flash.sh | Current experimental firmware for both MaxII and MaxV CPLDs. |
| ./flash_experimental.sh | Same as ./flash.sh above, but includes support for optional C1/C3 clock calculation for PiStorm2k. **ONLY for MaxII CPLDs** |
| ./flash_original.sh | This is the original firmware for MaxII CPLDs that was previously available before the experimental firmware became the standard. |
| ./flash_long_hold.sh | Long hold version of the original firmware. (Has longer AS, Data and Address hold times).|
| ./flash_longer_hold.sh | Longer hold version of the original firmware. (Has even longer AS, Data and Address hold times). **ONLY** available for the EPM240. |
| ./flash_long_data.sh | Test firmware which only extends Data hold time. Also includes a counter which forces the 68k bus statemachine to maintain the typical 4-cycle access scheme of a real 68k. |
| ./flash_PiStormX_Basic.sh | Port of the experimental PiStormX firmware for MaxII CPLDs. **ONLY** available for the EPM240. |
| ./flash_PiStormX_skip_s5s6.sh | Port of the experimental PiStormX firmware for MaxII CPLDs that skips s5 and s6 states when not in peripheral bus cycle. **ONLY** available for the EPM240. |


Please see the main PiStorm repository for futher information regarding PiStorm - https://github.com/captain-amygdala/pistorm
