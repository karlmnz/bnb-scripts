#!/bin/bash

# Find the new sink which should be the SUSPENDED one.
newSink=$(pactl list short sinks | grep 'SUSPENDED' | cut -f1)
# Sometimes IDLE rather than SUSPENDED
if [ -z $newSink ]; then
    newSink=$(pactl list short sinks | grep 'IDLE' | cut -f1)
fi

# Update the default sink to new sink
pacmd set-default-sink $newSink

# update all sink-inputs to new sink
pactl list short sink-inputs|while read stream; do
    streamId=$(echo $stream|cut '-d ' -f1)
    echo $streamId ' -> ' $newSink
    pactl move-sink-input "$streamId" "$newSink"
done
