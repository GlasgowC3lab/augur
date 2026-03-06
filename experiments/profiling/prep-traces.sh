#!/bin/bash

folder=$1
cluster=$2

cp $folder/rnaseq/sample_a/trace.csv traces/$cluster-rnaseq-a.csv
cp $folder/rnaseq/sample_b/trace.csv traces/$cluster-rnaseq-b.csv
cp $folder/rnaseq/sample_c/trace.csv traces/$cluster-rnaseq-c.csv
cp $folder/rnaseq/sample_d/trace.csv traces/$cluster-rnaseq-d.csv
cp $folder/rnaseq/sample_e/trace.csv traces/$cluster-rnaseq-e.csv

cp $folder/chipseq/sample_f/trace.csv traces/$cluster-chipseq-f.csv
cp $folder/chipseq/sample_g/trace.csv traces/$cluster-chipseq-g.csv
cp $folder/chipseq/sample_h/trace.csv traces/$cluster-chipseq-h.csv
cp $folder/chipseq/sample_i/trace.csv traces/$cluster-chipseq-i.csv
cp $folder/chipseq/sample_j/trace.csv traces/$cluster-chipseq-j.csv

cp $folder/nanoseq/sample_k/trace.csv traces/$cluster-nanoseq-k.csv
cp $folder/nanoseq/sample_l/trace.csv traces/$cluster-nanoseq-l.csv
cp $folder/nanoseq/sample_m/trace.csv traces/$cluster-nanoseq-m.csv
cp $folder/nanoseq/sample_n/trace.csv traces/$cluster-nanoseq-n.csv
cp $folder/nanoseq/sample_o/trace.csv traces/$cluster-nanoseq-o.csv

cp $folder/atacseq/sample_p/trace.csv traces/$cluster-atacseq-p.csv
cp $folder/atacseq/sample_q/trace.csv traces/$cluster-atacseq-q.csv
cp $folder/atacseq/sample_r/trace.csv traces/$cluster-atacseq-r.csv
cp $folder/atacseq/sample_s/trace.csv traces/$cluster-atacseq-s.csv
cp $folder/atacseq/sample_t/trace.csv traces/$cluster-atacseq-t.csv

# after running script must replace all instances of the hostname value ,-, with ,$node,
# e.g. ,-, becomes gpgnode-18 or hu-worker-c40 or aws-metal-c5d or aws-m5-4xl
