#!/bin/bash

# Kills multiplexed processes.
# Multiplexed SSH connections can stall.
# Credit: https://github.com/jmhobbs/helper-scripts/blob/master/ssh-kill-mux

function demux() {
	ps aux | grep ssh | grep '\[mux\]' | grep -v grep | awk '{print $2}' | xargs -t kill
}
