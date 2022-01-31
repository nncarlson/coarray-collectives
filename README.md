## Coarray Collectives

The `coarray_collectives` Fortran module aims to provide various collective
parallel procedures for Fortran coarray programs. These are in addition
to the several intrinsic collectives introduced in Fortran 2018.

Currently the module provides a single procedure, `co_sum_scan` which
computes a prefix sum across all images, similar to `MPI_Scan`.
