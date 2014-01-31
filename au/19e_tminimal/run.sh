#!/bin/bash

mv 79-Au.PBE.ini ~/
rm -r h* x*
mv ~/79-Au.PBE.ini .
psgen -o 79-Au.PBE 79-Au.PBE.ini
fhi2cpmd 79-Au.PBE.dat 79-Au.PBE.cpi 79-Au.PBE.cpmd.psp
pswatch -i 79-Au.PBE 79-Au.PBE.ini -l 1 
