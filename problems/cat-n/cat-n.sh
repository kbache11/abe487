#!/bin/bash

set -u

if [[ $# -lt 1 ]]; then
	echo "Usage: cat-n.sh file"
	exit 1
fi

INPUTFILECAT=$1
LINECOUNTCATA=$(wc -l $INPUTFILECAT)
LINECOUNTCATB=$(echo $LINECOUNTCATA | tr -cd '[[:digit:]]')
let LINECOUNTCATB++
i=1

while [[ $i -lt $LINECOUNTCATB ]]; do
	CURRENTLINEOFTEXT=$(sed "${i}q;d" $INPUTFILECAT)
	printf "%g %s\n" $i $CURRENTLINEOFTEXT
	let i++
done
