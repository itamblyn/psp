#!/bin/bash

name=78Pth

mv "$name".ini ~/
rm 78* x*
mv ~/"$name".ini .
psgen -o "$name" "$name".ini
~/git/psp/fhi2cpmd/fhi2cpmd "$name".dat "$name".cpi "$name".psp
pswatch -i "$name" "$name".ini -l 1
