#!/bin/bash

name=07-N:h

mv "$name".ini ~/
rm 07* x*
mv ~/"$name".ini .
~/git/psp/fhi98PP/bin/Tools/psgen -o "$name" "$name".ini
~/git/psp/fhi2cpmd/fhi2cpmd "$name".dat "$name".cpi "$name".psp
~/git/psp/fhi98PP/bin/Tools/pswatch -i "$name" "$name".ini -l 1
