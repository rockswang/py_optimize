from math import sqrt
import numba as nb
from numba import int32 as i4, b1
from numba.typed import List as nblist
from numba.types import ListType

@nb.njit([b1(i4)], locals=dict(i=i4))
def is_prime(n):
    if n <= 1:
        return False
    if n == 2:
        return True
    if n % 2 == 0:
        return False
    for i in range(3, int(sqrt(n)) + 1, 2):
        if n % i == 0:
            return False
    return True

@nb.njit([ListType(i4)()], locals=dict(i=i4))
def find_primes():
    primes = nblist()
    for i in range(2, 2**20 - 1):
        if is_prime(i):
            primes.append(i)
    return primes

# 测试程序
from timeit import timeit
from cProfile import run
code = '''
primes_list = find_primes();
print(len(primes_list))
'''
print(timeit(code, number=10, globals=globals()))
# run(code)
