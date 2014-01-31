#!/bin/bash

mv 07\-N:h.ini ~/
rm 07* x*
mv ~/07\-N:h.ini .
psgen -o 07\-N:h 07\-N:h.ini
fhi2cpmd 07\-N:h.dat 07\-N:h.cpi 07\-N:h.psp
pswatch -i 07\-N:h 07\-N:h.ini -l 1
