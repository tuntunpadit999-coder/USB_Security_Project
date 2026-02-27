#!/bin/bash

echo "Stopping Exam Mode..."

pkill -f exam_monitor.sh
pkill zenity

# Safety restore all devices
for id in $(xinput list | grep "slave" | awk -F'id=' '{print $2}' | awk '{print $1}')
do
    xinput enable $id
done

echo "Exam Mode Stopped."
