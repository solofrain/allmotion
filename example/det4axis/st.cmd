#!/bin/bash


# Range of EZ4Axis address
EZ4_ADDR_RANGE=2

# Number of ttyUSB to be searched on
TTYUSB_RANGE=1

# Number of retries
NUM_TRIES=3

#for port in $(seq 0 $(expr $TTYUSB_RANGE - 1))
for port in $(seq 0 $TTYUSB_RANGE)
do
    found=0
    if [ -e "/dev/ttyUSB$port" ]; then
        echo "/dev/ttyUSB$port found."
        
        # Who is on /dev/ttyUSB$port?
        stty -F /dev/ttyUSB$port raw speed 115200 min 0 time 10
        
        for addr in $(seq 1 $EZ4_ADDR_RANGE)
        do
		    echo "Looking for controller #$addr on /dev/ttyUSB$port..."
            for try in $(seq 1 $NUM_TRIES) # sometime the device doesn't ack or acks get lost
            do
                # Only the controller with addr being $addr acks the query
                echo -e "/$addr&\x0d" > /dev/ttyUSB$port
                sleep 1
                rec="$(cat -v /dev/ttyUSB$port)"
                echo $rec
                leng=${#rec}
                #echo $leng
                if [ $leng -gt 3 ]; then
                    echo "EZ4Axis #$addr on /dev/ttyUSB$port"
                    export TTYUSB$port=$addr
			        found=1
                    break
                fi
            done 
			if [ $found -eq 1 ]; then
			    break
			fi
        done
    else
        echo "/dev/ttyUSB$port not found. Please check the connections."
    fi
done

read -p "Press enter to continue..."

./st.cmd.base
