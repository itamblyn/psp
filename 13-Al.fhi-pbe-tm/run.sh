#!/bin/bash

name=13-Al:tm

mv "$name".ini ~/
rm 13* x*
mv ~/"$name".ini .
psgen -o "$name" "$name".ini
fhi2cpmd "$name".dat "$name".cpi "$name".psp
pswatch -i "$name" "$name".ini -l 2
