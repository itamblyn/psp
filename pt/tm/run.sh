#!/bin/bash

name=78-Pt:tm

mv "$name".ini ~/
rm 78* x*
mv ~/"$name".ini .
psgen -o "$name" "$name".ini
fhi2cpmd "$name".dat "$name".cpi "$name".psp
pswatch -i "$name" "$name".ini -l 2
