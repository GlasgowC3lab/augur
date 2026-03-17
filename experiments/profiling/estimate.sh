#!/bin/bash

cp traces/$cluster* data/traces/
python -m src.scripts.NFTracesToUniversal

# GPGNODE-18 SETTING: 1.0 ondemand_linear 60 1.0 0.392 64 1
# HU-C40 SETTING: 1.0 performance_linear 60 1.0 0.392 256 1
# AWS c5d METAL SETTING: default_linear 60 1.0 0.392 192 1
# AWS m5 4xl SETTING: MODEL with GA mode -> 240W TDP (can't find better data that aligns with the server) 1.0 0.392 64 1

python -m src.scripts.IchnosCF $cluster-rnaseq-a.csv BASE
python -m src.scripts.IchnosCF $cluster-rnaseq-b.csv BASE
python -m src.scripts.IchnosCF $cluster-rnaseq-c.csv BASE
python -m src.scripts.IchnosCF $cluster-rnaseq-d.csv BASE
python -m src.scripts.IchnosCF $cluster-rnaseq-e.csv BASE

python -m src.scripts.IchnosCF $cluster-chipseq-f.csv BASE
python -m src.scripts.IchnosCF $cluster-chipseq-g.csv BASE
python -m src.scripts.IchnosCF $cluster-chipseq-h.csv BASE
python -m src.scripts.IchnosCF $cluster-chipseq-i.csv BASE
python -m src.scripts.IchnosCF $cluster-chipseq-j.csv BASE

python -m src.scripts.IchnosCF $cluster-nanoseq-k.csv BASE
python -m src.scripts.IchnosCF $cluster-nanoseq-l.csv BASE
python -m src.scripts.IchnosCF $cluster-nanoseq-m.csv BASE
python -m src.scripts.IchnosCF $cluster-nanoseq-n.csv BASE
python -m src.scripts.IchnosCF $cluster-nanoseq-o.csv BASE

python -m src.scripts.IchnosCF $cluster-atacseq-p.csv BASE
python -m src.scripts.IchnosCF $cluster-atacseq-q.csv BASE
python -m src.scripts.IchnosCF $cluster-atacseq-r.csv BASE
python -m src.scripts.IchnosCF $cluster-atacseq-s.csv BASE
python -m src.scripts.IchnosCF $cluster-atacseq-t.csv BASE
