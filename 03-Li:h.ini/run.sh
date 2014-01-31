#!/bin/bash

mv 03-Li:h.ini ~/
rm 03* x*
mv ~/03-Li:h.ini .
psgen -o 03-Li:h 03-Li:h.ini
fhi2cpmd 03-Li:h.dat 03-Li:h.cpi 03-Li:h.psp
pswatch -i 03-Li:h 03-Li:h.ini -l 1
