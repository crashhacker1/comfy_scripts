#!/bin/bash
# move the files or delete them while scrolling through them from feh image viewer

while read i; do
    file+=( "$i" )
done < <(ls | sort -R)

for i in $(seq 0 "${#file[@]}");do
    if [[ "${file[$i]}" =~ .*.jpg ]];then
        gifview -a "${file[$i]}"
        read -s -n 1 choice
        case $choice in
            1)    //Command to execute//
                  ;;
            2)    //Other Command to execute//
                  ;;
        esac
    else
        feh -rqzZFVY --cycle-once --action1 "//Comand to execute//" --action2 "//Other command to execute// "${file[$i]}"
    fi
done
