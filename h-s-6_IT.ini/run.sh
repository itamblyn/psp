#!/bin/bash

mv h-s-6_IT.ini ~/
rm h* x*
mv ~/h-s-6_IT.ini .
psgen -o h-s-6_IT h-s-6_IT.ini
fhi2cpmd h-s-6_IT.dat h-s-6_IT.cpi h-s-6_IT.cpmd.psp

