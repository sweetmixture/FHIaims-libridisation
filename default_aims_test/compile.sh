module restore
module load PrgEnv-gnu
module load cmake

export FHI_AIMS_ROOT="/work/e05/e05/wkjee/Software/fhi-aims.221103"

ftn -c aims.f90 -I/work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/modules
#ftn -o aims.x aims.o -I/work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/modules -L/work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu -laims.221103.scalapack.mpi
#ftn -o aims.x aims.o -I/work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/modules /work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/libaims.221103.scalapack.mpi.so
#ftn -o aims.x aims.o -I/work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/modules -L/work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu -laims.221103.scalapack.mpi \
#		-L /work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/subdirectory_aims1/build -laims1 \
#		-L /work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/subdirectory_aims2/build -laims2 \
#		-L /work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/subdirectory_aims3/build -laims3 \
#		-L /work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/subdirectory_aims4/build -laims4 \
#		-L /work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/subdirectory_aims5/build -laims5 \
#		-L /work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/subdirectory_aims6/build -laims6 \
#		-L /work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/subdirectory_aims7/build -laims7 \
#		-L /work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/subdirectory_aims8/build -laims8 \
#		-L /work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/subdirectory_aims9/build -laims9

ftn -o aims.x aims.o -I/work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/modules \
		-L /work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/subdirectory_aims1/build -laims1 \
		-L /work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/subdirectory_aims2/build -laims2 \
		-L /work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/subdirectory_aims3/build -laims3 \
		-L /work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/subdirectory_aims4/build -laims4 \
		-L /work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/subdirectory_aims5/build -laims5 \
		-L /work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/subdirectory_aims6/build -laims6 \
		-L /work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/subdirectory_aims7/build -laims7 \
		-L /work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/subdirectory_aims8/build -laims8 \
		-L /work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/subdirectory_aims9/build -laims9 \
	    -L /work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu -laims.221103.scalapack.mpi

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

#mpif90 -o aims.custom.f90 aims.o -I/work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/modules -L/work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu -laims.221103.scalapack.mpi
#ftn -o aims.custom.f90 aims.o -I/work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/modules -L/work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/aims.221103.scalapack.mpi.so
#ftn -o aims.custom.f90 aims.o -I/work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/modules -L/work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu -laims.221103.scalapack.mpi
#ftn -o aims.custom.f90 aims.o -I/work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/modules -L/work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu -laims
#ftn -o aims.custom.f90 aims.o -I/work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu/modules -L/work/e05/e05/wkjee/Software/fhi-aims.221103/_build-gnu -llibaims
