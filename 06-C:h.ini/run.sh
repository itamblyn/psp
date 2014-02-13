#!/bin/bash

mv 06\-C:h.ini ~/
rm 06* x*
mv ~/06\-C:h.ini .
psgen -o 06\-C:h 06\-C:h.ini
~/git/psp/fhi2cpmd/fhi2cpmd 06\-C:h.dat 06\-C:h.cpi 06\-C:h.psp
pswatch -i 06\-C:h 06\-C:h.ini -l 2
