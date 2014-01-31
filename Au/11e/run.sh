#!/bin/bash

mv 79-Au.GGA.ini ~/
rm h* x*
mv ~/79-Au.GGA.ini .
psgen -o 79-Au.GGA 79-Au.GGA.ini
fhi2cpmd 79-Au.GGA.dat 79-Au.GGA.cpi 79-Au.GGA.cpmd.psp
