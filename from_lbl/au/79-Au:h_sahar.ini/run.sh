#!/bin/bash

name=79-Au:h

mv "$name".ini ~/
rm 79* x*
mv ~/"$name".ini .
psgen -o "$name" "$name".ini
#fhi2cpmd "$name".dat "$name".cpi "$name".psp
pswatch -i "$name" "$name".ini -l 1
