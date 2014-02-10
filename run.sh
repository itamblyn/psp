#!/bin/bash

name=16-S:h

mv "$name".ini ~/
rm 16* x*
mv ~/"$name".ini .
psgen -o "$name" "$name".ini
~/git/fhi2cpmd/fhi2cpmd "$name".dat "$name".cpi "$name".psp
pswatch -i "$name" "$name".ini -l 1
