if pgrep -x "emulator" > /dev/null
then
    echo "PiStorm emulator is running, please stop it first"
    exit 1
fi
echo "Flashing..."
sudo openocd -f ./nprog/68new_long_hold.cfg > nprog_log.txt 2>&1
if [ $? -ne 0 ]
then
    echo "Flashing failed, please see nprog_log.txt for details"
    exit 1
else
    echo "Flashing successful!"
fi

