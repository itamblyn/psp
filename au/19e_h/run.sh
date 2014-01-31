#!/bin/bash

export PATH=$PATH:/usr/local/fhi98PP/bin/Tools/

mv 79-Au.PBE.ini ~/
rm -r h* x*
mv ~/79-Au.PBE.ini .
psgen -o 79-Au.PBE 79-Au.PBE.ini
pswatch -i 79-Au.PBE 79-Au.PBE.ini -l 1 
