#!/bin/tcsh

set element="05-B:h"

mv "$element".ini ~/
rm 05* x*
mv ~/"$element".ini .
psgen -o "$element" "$element".ini
fhi2cpmd "$element".dat "$element".cpi "$element".psp
pswatch -i "$element" "$element".ini -l 2 
