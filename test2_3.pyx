from libc.math cimport sqrt

import numpy as np

from libc.stdint cimport *
cimport cython
cimport numpy as np

np.import_array()

@cython.boundscheck(False)  # Deactivate bounds checking
@cython.wraparound(False)   # Deactivate negative indexing
@cython.cdivision(True)
@cython.nonecheck(True)
cdef bint is_prime(int32_t n):
    cdef int32_t up, i
    if n <= 1:
        return False
    if n == 2:
        return True
    if n % 2 == 0:
        return False
    up = <int32_t>sqrt(n) + 1
    for i in range(3, up, 2):
        if n % i == 0:
            return False
    return True

@cython.boundscheck(False)  # Deactivate bounds checking
@cython.wraparound(False)   # Deactivate negative indexing
cpdef find_primes():
    cdef Py_ssize_t i, c = 0
    cdef np.ndarray[int32_t, ndim=1] primes = np.empty(100000, np.int32)
    cdef int32_t[:] pview = primes
    cdef int32_t* pp = &pview[0]

    for i in range(2, 2**20 - 1):
        if is_prime(i):
            pp[c] = i
            c += 1
    return primes[0:c].copy()

