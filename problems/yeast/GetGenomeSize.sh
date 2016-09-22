#!/bin/bash

set -u

cd ./fasta

HEADCOUNT1=$(head -n 1 chr01.fsa | wc -m)
HEADCOUNT2=$(head -n 1 chr02.fsa | wc -m)
HEADCOUNT3=$(head -n 1 chr03.fsa | wc -m)
HEADCOUNT4=$(head -n 1 chr04.fsa | wc -m)
HEADCOUNT5=$(head -n 1 chr05.fsa | wc -m)
HEADCOUNT6=$(head -n 1 chr06.fsa | wc -m)
HEADCOUNT7=$(head -n 1 chr07.fsa | wc -m)
HEADCOUNT8=$(head -n 1 chr08.fsa | wc -m)
HEADCOUNT9=$(head -n 1 chr09.fsa | wc -m)
HEADCOUNT10=$(head -n 1 chr10.fsa | wc -m)
HEADCOUNT11=$(head -n 1 chr11.fsa | wc -m)
HEADCOUNT12=$(head -n 1 chr12.fsa | wc -m)
HEADCOUNT13=$(head -n 1 chr13.fsa | wc -m)
HEADCOUNT14=$(head -n 1 chr14.fsa | wc -m)
HEADCOUNT15=$(head -n 1 chr15.fsa | wc -m)
HEADCOUNT16=$(head -n 1 chr16.fsa | wc -m)
TOTALHEADCOUNT=$(($HEADCOUNT1 + $HEADCOUNT2 + $HEADCOUNT3 + $HEADCOUNT4 + $HEADCOUNT5 + $HEADCOUNT6 + $HEADCOUNT7 + $HEADCOUNT8 + $HEADCOUNT9 + $HEADCOUNT10 + $HEADCOUNT11 + $HEADCOUNT12 + $HEADCOUNT13 + $HEADCOUNT14 + $HEADCOUNT15 + $HEADCOUNT16))

CHARCOUNT=$(wc -m genome.fa)
TOTALNUMBEROFCHARS=$(echo $CHARCOUNT | tr -cd '[[:digit:]]')
NUMBEROFBASES=$(($TOTALNUMBEROFCHARS - $TOTALHEADCOUNT))

cd ..

echo $NUMBEROFBASES > chr-size.txt

