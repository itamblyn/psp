#!/bin/bash

name=05-B:h

mv "$name".ini ~/
rm 05* x*
mv ~/"$name".ini .
psgen -o "$name" "$name".ini
fhi2cpmd "$name".dat "$name".cpi "$name".psp
pswatch -i "$name" "$name".ini -l 1
