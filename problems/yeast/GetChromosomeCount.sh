#!/bin/bash

set -u

cd ./fasta

INPUTFILECNT=genome.fa
LINECOUNTCNTA=$(wc -l $INPUTFILECNT)
LINECOUNTCNTB=$(echo $LINECOUNTCNTA | tr -cd '[[:digit:]]')
let LINECOUNTCNTB++
i=1
CHROMOSOMECNT=0
CHROMOSOMEMARK=">tpg"

while [[ $i -lt $LINECOUNTCNTB ]]; do
	CURRENTLINEOFTEXT=$(sed "${i}q;d" $INPUTFILECNT)
	TARGETTEXT=$(echo 'expr substr $CURRENTLINEOFTEXT 1 4')
	if [ TARGETTEXT == CHROMOSOMEMARK ]
		then
			let CHROMOSOMECNT++
			echo "found one!"
	fi
	let i++
done

cd..

CHROMOSOMECNT > chr-count.txt

