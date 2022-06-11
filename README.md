# PiStorm Firmware

This is a bundle of all current, original, and experimental/test PiStorm firmwares. Just run the relevant flash command to flash the required firmware.

## Instructions

You must have OpenOCD installed to be able to flash the CPLD firmware.

To install OpenOCD run:
`sudo apt-get install openocd`

Run the firmware update with with the relevant command listed below, this will automatically detect your CPLD version and flash appropriately.

If successful "Flashing successful!" will appear, if not it will fail with "Flashing failed" and `nprog_log.txt` will be created with more details.

## Included Firmware

| Command | Description |
| ----------- | ----------- |
| ./flash.sh | Current experimental firmware for both MaxII and MaxV CPLDs. (Includes support for optional C1/C3 clock calculation for PiStorm2k) |
| ./flash_experimental.sh | Same as ./flash.sh above, but does not include MaxV CPLDs |
| ./flash_original.sh | This is the original firmware for MaxII CPLDs that was previously available. |
| ./flash_long_hold.sh | Long hold version of the original firmware. |
| ./flash_longer_hold.sh | Longer hold version of the original firmware. (Has longer AS, Data and Address hold times). **ONLY** available for the EPM240) |
| ./flash_long_data.sh | Test firmware which only extends Data hold time. Also includes a counter which forces the 68k bus statemachine to maintain the typical 4-cycle access scheme of a real 68k. |

**Note** Due to a mix up some time ago when the C1/C3 clock calculation was implemented, the original firmware was overwritten with a copy of the experimental version. Due to this running either ./flash.sh or ./flash_experimental.sh will install the same firmware. If you require the original non-experimental firmware then please run ./flash_original.sh



Please see the main PiStorm repository for futher information regarding PiStorm - https://github.com/captain-amygdala/pistorm