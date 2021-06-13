download_data: cov_genome.gtf cov_https:bam

cov_genome.gtf:
    wget -O cov_genome.gtf https://github.com/nf-core/test-datasets/raw/modules/data/genomics/sarscov2/genome/genome.gtf

cov_text.paired_end.sorted.bam:
    wget -O cov_test.paired_end.sorted.bam github.com/nf-core/test-datasets/raw/modules/data/genomics/sarscov2/illumina/bam/test.paired_end.sorted.bam

download_data: genome.gtf test.paired_end.sorted.bam

genome.gtf:
    wget https://github.com/nf-core/test-datasets/raw/modules/data/genomics/homo_sapiens/genome/genome.gtf

test.paired_end.sorted.bam:
    wget https://github.com/nf-core/test-datasets/raw/modules/data/genomics/homo_sapiens/illumina/bam/test.paired_end.sorted.bam

conda_env:
	conda env create --name=more-map-and-call --file=env.yaml

clean:
	rm genome.gtf test.paired_end.sorted.bam

