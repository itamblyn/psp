#!/bin/bash

mv 04\-Be:h.ini ~/
rm 04* x*
mv ~/04\-Be:h.ini .
psgen -o 04\-Be:h 04\-Be:h.ini
fhi2cpmd 04\-Be:h.dat 04\-Be:h.cpi 04\-Be:h.psp
pswatch -i 04\-Be:h 04\-Be:h.ini -l 2 
