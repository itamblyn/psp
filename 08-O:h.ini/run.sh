#!/bin/bash

name=08-O:h

mv "$name".ini ~/
rm 08* x*
mv ~/"$name".ini .
psgen -o "$name" "$name".ini
fhi2cpmd "$name".dat "$name".cpi "$name".psp
pswatch -i "$name" "$name".ini -l 1
