import pathlib 

from wfcommons import EpigenomicsRecipe  # BlastRecipe
from wfcommons.wfbench import WorkflowBenchmark, NextflowTranslator

# create a workflow benchmark object to generate specifications based on a recipe
benchmark = WorkflowBenchmark(recipe=EpigenomicsRecipe, num_tasks=50)

# generate a specification based on performance characteristics
benchmark.create_benchmark(pathlib.Path("/tmp/"), cpu_work=100, data=1000, percent_cpu=0.7)

# generate a Nextflow workflow
translator = NextflowTranslator(benchmark.workflow)
translator.translate(output_folder=pathlib.Path("./nextflow-wf/"))
                                                

# must replace
# sed -i 's:/Users/westkath/UofG/PhD/year-1/augur/tool/infrastructure-profiler:/users/grad/kathleen/benchmark-test:g' bin/*
