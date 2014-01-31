#!/bin/bash

mv 06\-C:tm.ini ~/
rm 06* x*
mv ~/06\-C:tm.ini .
psgen -o 06\-C:tm 06\-C:tm.ini
fhi2cpmd 06\-C:tm.dat 06\-C:tm.cpi 06\-C:tm.psp
pswatch -i 06\-C:tm 06\-C:tm.ini -l 1
