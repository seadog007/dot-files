#!/bin/bash
# Prevent annoying tmux resizing
#col=0
#row=0
col=204
row=45

[ `tput cols` -lt $col ] && echo '寬度不足' && exit 1
[ `tput lines` -lt $row ] && echo '高度不足' && exit 1
[ -z "$2" ] && echo -e "`date`\t$1\tLogined, Readonly" >> ~/.ssh/log && tmux -2 attach -t 0 -r
[ -n "$2" ] && echo -e "`date`\t$1\tLogined" >> ~/.ssh/log && tmux -2 attach -t 0
