all: download_data featurecounts

featureCounts: cov_counts.txt

cov_counts.txt:
	sbatch submit_cov.sh

download_data: genome.gtf test.paired_end.sorted.bam cov_genome.gtf cov_https:bam

cov_genome.gtf:
	wget -O cov_genome.gtf https://github.com/nf-core/test-datasets/raw/modules/data/genomics/sarscov2/genome/genome.gtf

cov_text.paired_end.sorted.bam:
	wget -O cov_test.paired_end.sorted.bam github.com/nf-core/test-datasets/raw/modules/data/genomics/sarscov2/illumina/bam/test.paired_end.sorted.bam

genome.gtf:
	wget https://github.com/nf-core/test-datasets/raw/modules/data/genomics/homo_sapiens/genome/genome.gtf

test.paired_end.sorted.bam:
	wget https://github.com/nf-core/test-datasets/raw/modules/data/genomics/homo_sapiens/illumina/bam/test.paired_end.sorted.bam

conda_env:
	conda env create --name=more-map-and-call --file=env.yaml

clean:
	rm genome.gtf test.paired_end.sorted.bam
	rm -f .nextflow.log*
	rm -rf .nextflow*
	rm -rf work

SHELL:=/bin/bash
NXF_VER:=21.04.1

install: ./nextflow

./nextflow:
	export NXF_VER="$(NXF_VER)" && \
	curl -fsSL get.nextflow.io | bash

run: install
	./nextflow run nf-core/rnaseq -r 3.1 -profile utd_sysbio -params-file nf-params.json