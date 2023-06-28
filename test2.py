from test2_2 import find_primes


# 测试程序
from timeit import timeit
from cProfile import run
code = '''
primes_list = find_primes();
print(len(primes_list))
'''
print(timeit(code, number=10, globals=globals()))
# run(code)
