#!/bin/bash
# move images while viewing them through feh image viewer

feh *.jpg --action1 "mv %f ./positive/" --action2 "mv %f ./negative/" --action3 "mv %f ./validation/"
