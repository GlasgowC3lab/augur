for filefw in ./*$fw.fastq.gz; do
    filere=${filefw%$fw.fastq.gz}$re.fastq.gz
    for split in $splits; do
    seqkit split2 -1 $filefw -2 $filere -p $split -O temp/ -f
    mkdir -p split$split/
    cp temp/*$fw.part_001.fastq.gz split$split/$filefw
    cp temp/*$re.part_001.fastq.gz split$split/$filere
    done



# commands I've been running
original size? 
split 4 size?
split 8 size?
seqkit split2 -1 ERR034564_1.fastq.gz -2 ERR034564_2.fastq.gz -p 4 -O temp-4/ -f
seqkit split2 -1 ERR034564_1.fastq.gz -2 ERR034564_2.fastq.gz -p 8 -O temp-4/ -f

trimgalore -- track the energy on the same node (?!)


# run task and monitor -- write the output to a file and re-run

ERR034564_1.part_001.fastq.gz  
ERR034564_2.part_001.fastq.gz


sample_1.fastq.gz
sample_2.fastq.gz

sample_split4_1.fastq.gz
sample_split4_2.fastq.gz

sample_split8_1.fastq.gz
sample_split8_2.fastq.gz


take runtime of task w/ 1/8 
take runtime of task w/ 1/4 
what is the rate of expansion ? 

what would you predict the runtime and energy to be for the full length task
what was the runtime and energy of the full task on this node
can we use the runtime difference of other tasks to predict the runtime of the task
can we use the energy difference of other tasks to predict the energy on other nodes?

