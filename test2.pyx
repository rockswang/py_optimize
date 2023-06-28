import math

def is_prime(n):
    if n <= 1:
        return False
    if n == 2:
        return True
    if n % 2 == 0:
        return False
    for i in range(3, int(math.sqrt(n)) + 1, 2):
        if n % i == 0:
            return False
    return True

def find_primes():
    primes = []
    for i in range(2, 2**20 - 1):
        if is_prime(i):
            primes.append(i)
    return primes

