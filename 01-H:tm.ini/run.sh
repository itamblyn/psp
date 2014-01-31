#!/bin/bash

mv 01\-H:tm.ini ~/
rm 01* x*
mv ~/01\-H:tm.ini .
psgen -o 01\-H:tm 01\-H:tm.ini
fhi2cpmd 01\-H:tm.dat 01\-H:tm.cpi 01\-H:tm.psp
pswatch -i 01\-H:tm 01\-H:tm.ini -l 1
