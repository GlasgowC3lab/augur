import pathlib

from wfcommons import BlastRecipe 
from wfcommons.wfbench import WorkflowBenchmark, NextflowTranslator

# create a workflow benchmark object to generate specifications based on a recipe 
benchmark = WorkflowBenchmark(recipe=BlastRecipe, num_tasks=120)

# generate a specification based on performance characteristics 
benchmark.create_benchmark(pathlib.Path('./tmp/'), cpu_work=100, data=500, percent_cpu=0.6)

# generate a Nextflow workflow 
translator = NextflowTranslator(benchmark.workflow) 
translator.translate(output_folder=pathlib.Path('./benchmark'))


# todo: make more than 1 benchmark, make these more specific/meaningful? 
