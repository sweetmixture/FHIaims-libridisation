#!/bin/bash

# Slurm job options (job-name, compute nodes, job time)
#SBATCH --job-name=tf_single
#SBATCH --time=0:20:00
#SBATCH --nodes=2

# Replace [budget code] below with your budget code (e.g. t01)
#SBATCH --account=e05-gc-sok
#SBATCH --partition=standard
#SBATCH --qos=short

# Set the number of threads to 1
#   This prevents any threaded system libraries from automatically 
#   using threading.
export OMP_NUM_THREADS=1

# Launch the parallel job
#   Using 512 MPI processes and 128 MPI processes per node
#   srun picks up the distribution from the sbatch options

export LD_LIBRARY_PATH=/work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/subdirectory_aims1/build:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/subdirectory_aims2/build:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/subdirectory_aims3/build:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/subdirectory_aims4/build:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/subdirectory_aims5/build:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/subdirectory_aims6/build:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/subdirectory_aims7/build:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/subdirectory_aims8/build:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/subdirectory_aims9/build:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu:$LD_LIBRARY_PATH

srun --ntasks-per-node=128 --cpus-per-task=1 --distribution=block:block --hint=nomultithread --exact \
    /work/e05/e05/wkjee/Software/gulpklmc/klmc3_tf_interface.fhiaims.14082023/aimsklmc.x \
	1> stdout 2> stderr

