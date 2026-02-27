#!/bin/bash

LOGFILE="./usb_log.txt"

echo "Monitoring USB devices..."

while true
do
    if lsblk -o NAME,TRAN | grep -q usb; then

        USERNAME=$(whoami)
        TIME=$(date)

        echo "USB inserted by $USERNAME at $TIME" >> "$LOGFILE"
        echo "USB detected! Locking system..."

        # 🔴 Store device IDs BEFORE disabling
        POINTER_IDS=$(xinput list | grep "slave  pointer" | awk -F'id=' '{print $2}' | awk '{print $1}')
        KEYBOARD_IDS=$(xinput list | grep "slave  keyboard" | awk -F'id=' '{print $2}' | awk '{print $1}')

        # 🔴 Disable pointer devices
        for id in $POINTER_IDS
        do
            xinput disable $id
        done

        # 🔴 Disable keyboard devices
        for id in $KEYBOARD_IDS
        do
            xinput disable $id
        done

        # 🔴 Show blocking popup (background)
        zenity --error \
        --title="EXAM SECURITY ALERT" \
        --text="USB DEVICE DETECTED!\nREMOVE IMMEDIATELY!" \
        --width=1200 \
        --height=700 &

        ZEN_PID=$!

        # 🔄 Wait until USB removed
        while lsblk -o NAME,TRAN | grep -q usb
        do
            sleep 1
        done

        echo "USB removed at $(date)" >> "$LOGFILE"
        echo "Restoring system..."

        # 🟢 Re-enable SAME stored devices
        for id in $POINTER_IDS
        do
            xinput enable $id
        done

        for id in $KEYBOARD_IDS
        do
            xinput enable $id
        done

        kill $ZEN_PID

        # 🟢 Show final warning popup
        zenity --warning \
        --title="WARNING" \
        --text="USB Removed.\nDo NOT insert pendrive again!" \
        --width=600 \
        --height=300

    fi

    sleep 2
done
