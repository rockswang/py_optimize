from math import sqrt

from libc.stdint cimport *
cimport cython

@cython.boundscheck(False)  # Deactivate bounds checking
@cython.wraparound(False)   # Deactivate negative indexing
cdef bint is_prime(int32_t n):
    cdef int32_t up, i
    if n <= 1:
        return False
    if n == 2:
        return True
    if n % 2 == 0:
        return False
    up = int(sqrt(n)) + 1
    for i in range(3, up, 2):
        if n % i == 0:
            return False
    return True

@cython.boundscheck(False)  # Deactivate bounds checking
@cython.wraparound(False)   # Deactivate negative indexing
cpdef find_primes():
    cdef Py_ssize_t i
    primes = []
    for i in range(2, 2**20 - 1):
        if is_prime(i):
            primes.append(i)
    return primes

