#!/bin/bash

nextflow run nf-core/sarek -r 3.5.1 -profile test_full -c nf-sarek-ae.config --tools mutect2 > sample_ae.log
