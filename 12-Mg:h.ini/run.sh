#!/bin/bash

mv 12-Mg\:h.ini ~/
rm 12* x*
mv ~/12-Mg\:h.ini .
psgen -o 12-Mg\:h 12-Mg\:h.ini
fhi2cpmd 12-Mg\:h.dat 12-Mg\:h.cpi 12-Mg\:h.psp
pswatch -i 12-Mg\:h 12-Mg\:h.ini -l 1
