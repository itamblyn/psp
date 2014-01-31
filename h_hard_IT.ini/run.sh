#!/bin/bash

mv h_hard_IT.ini ~/
rm h* x*
mv ~/h_hard_IT.ini .
psgen -o h_hard_IT h_hard_IT.ini
fhi2cpmd h_hard_IT.dat h_hard_IT.cpi h_hard_IT.cpmd.psp
pswatch -i h_hard_IT h_hard_IT.ini -l 0

