#!/bin/bash

set -u

mkdir fasta

INPUTFILEDL=ListOfInputFiles.txt
LINECOUNTDLA=$(wc -l $INPUTFILEDL)
LINECOUNTDLB=$(echo $LINECOUNTDLA | tr -cd '[[:digit:]]')
let LINECOUNTDLB++
i=1

while [[ $i -lt $LINECOUNTDLB ]]; do
	CURRENTLINEOFTEXT=$(sed "${i}q;d" $INPUTFILEDL)
	wget $CURRENTLINEOFTEXT
	CURRENTFILENAME=$(echo ${CURRENTLINEOFTEXT:(-9)})
	mv $CURRENTFILENAME ./fasta
	let i++
done
