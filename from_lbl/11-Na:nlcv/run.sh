#!/bin/bash

name=na-nlcv

mv "$name".ini ~/
rm na* x*
mv ~/"$name".ini .
psgen -o "$name" "$name".ini
#fhi2cpmd "$name".dat "$name".cpi "$name".psp
pswatch -i "$name" "$name".ini -l 1
