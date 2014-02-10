#!/bin/bash

mv 29-Cu.LDA.ini ~/
rm -f h* x*
mv ~/29-Cu.LDA.ini .
psgen -o 29-Cu.LDA 29-Cu.LDA.ini
~/git/psp/fhi2cpmd/fhi2cpmd 29-Cu.LDA.dat 29-Cu.LDA.cpi 29-Cu.LDA.cpmd.psp
pswatch -i 29-Cu.LDA 29-Cu.LDA.ini -l 1 
