#!/bin/bash

mv au.ini ~/
rm h* x*
mv ~/au.ini .
psgen -o au au.ini
fhi2cpmd au.dat au.cpi au.cpmd.psp
pswatch -i au au.ini -l 0
