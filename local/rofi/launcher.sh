#!/usr/bin/env bash


## launcher-1 launcher-2 launcher-3 launcher-4 launcher-5 launcher-6 launcher-7    

dir="$HOME/.config/rofi/styles"
theme='launcher-7'

## Run
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
