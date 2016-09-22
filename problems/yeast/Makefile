.PHONY: all fasta features test clean

all: clean fasta genome chr-count chr-size features gene-count verified-genes uncharacterized-genes gene-types palinsreg terminated-genes

clean:
	find . \( -name \*gene\* -o -name chr-\* \) -exec rm {} \;

fasta:
	./GetFilesDownloaded.sh
	
genome: fasta
	./GetGenomeFile.sh

chr-count: genome
	./GetChromosomeCount.sh

chr-size: genome
	./GetGenomeSize.sh

features:
	echo "Download SGD_features.tab"

gene-count: features
	echo OK > gene-count

verified-genes: features
	echo OK > verified-genes

uncharacterized-genes: features
	echo OK > uncharacterized-genes

gene-types: features
	echo OK > gene-types

palinsreg:
	echo "Download palinsreg"

terminated-genes: palinsreg
	echo OK > terminated-genes

test:
	./test.pl6
