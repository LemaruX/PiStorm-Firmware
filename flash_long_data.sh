#!/bin/bash
set -o pipefail
if pgrep -x "emulator" > /dev/null
then
    echo "PiStorm emulator is running, please stop it first"
    exit 1
fi
if ! command -v ./pistormflash &> /dev/null
then
    echo "pistormflash tool cannot be found."
    exit 1
fi
echo -ne "Detecting CPLD... "
version=$(./pistormflash -c 2>/dev/null | awk -F "," 'FNR == 1 { print $1 }')
case $version in
	"idcode=0x020a10dd")
		echo "EPM240 detected!"
		echo ""
		./pistormflash -s ./rtl/EPM240_long_data.svf
		if [ $? -eq 0 ]
		then
			echo "CPLD flashed successfully!"
  			exit 0
		else
  			echo "Error flashing CPLD."
  			exit 1
		fi
		;;
	"idcode=0x020a20dd")
		echo "EPM570 detected!"
		echo ""
		./pistormflash -s ./rtl/bitstream_long_data.svf
		if [ $? -eq 0 ]
		then
			echo "CPLD flashed successfully!"
  			exit 0
		else
  			echo "Error flashing CPLD."
  			exit 1
		fi
		;;
	"idcode=0x020a50dd")
		echo "MAXV240 detected!"
		echo ""
		echo "A MAXV240 version of this firmware does not exist, please select another firmware"
  		exit 1
		;;
	*)
		echo "Could not detect CPLD."
		exit 1
		;;
esac
