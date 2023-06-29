[中文版](README_zh.md)

# py_optimize
Python Optimization Demonstration Project, showcasing various optimization techniques such as Cython, Numba, Numpy, etc., and providing benchmark references in C# & Java.

The goal of this project is to calculate all prime numbers between 2 and 2^20.
PS. All code were generated by ChatGPT.

## About Souce Code

Source File | Description
---- | ----
test.cs | Benchmark Reference, C# version
Test.java | Benchmark Reference, Java version
test1.py | Pure Python
test2.py | Cython test entry
test2.pyx | Pure Python clone, without any modification
test2_1.pyx | Add parameter, return value, and local variable type information.
test2_2.pyx | Using C version `math.sqrt`
test2_3.pyx | Convert the list to a NumPy array and use memory views to directly access array elements via pointers.
test3.py | Use Numba to optimize only the "is_prime" function.
test3_1.py | Optimize the "find_primes" function using Numba and replace Python lists with Numba's built-in typed list.
setup.py | Cython build script. With "annotate=True" to enable annotation mode, the compilation also generates an HTML file that helps developers quickly identify performance bottlenecks.

## Results

Version | Execution Time | Benchmark ratio
---- | ----- | -----
C# |  ~0.9s | 100%
Java | ~0.93s | 103%
Pure Python | ~24s | 2667%
Python to Cython clone | ~15s | 1667%
Cython type added | ~1.72s | 191%
Cython C version `sqrt` | ~0.96s | 107%
Cython Numpy & MemoryView | ~0.87s | 97%
Numba jit on `is_prime` only | ~2.7s | 300%
Numba use type-list | ~1.04s | 115%

## Conclusion
1. The JIT (Just-In-Time) virtual machines of C# and Java are quite powerful and are on par with Python optimized to the extreme.
2. Without changing a single line of code, simply transitioning from interpreting Python source code to compiling it can improve performance by at least 20% and enable code encryption. There is no reason not to include this treatment in the release version.
3. Cython enables progressive and localized optimization. With a small amount of new knowledge built upon Python, significant performance improvements on the order of magnitude can be achieved. Unlike many other languages' native optimization techniques, it doesn't require learning a new language or syntax.
4. After analyzing performance bottlenecks using cProfile, you can directly optimize the most impactful parts by simply adding parameter, return value, and local variable type annotations, which can yield excellent results.
5. One of the main bottlenecks lies in the conversion between Python objects and C types. Minimizing such conversions by using C functions can maximize performance gains.
6. Numpy, with its memory management taken care of, allows for optimal balance between performance and complexity when combined with Numpy arrays and memory views.
7. In this example, the size of the resulting list data is relatively small and requires no processing, which doesn't showcase the full power and performance of Numpy. Numpy is the killer framework for Python.
8. Numba has certain limitations and incurs a startup cost upon first invocation. However, it doesn't require compilation and can retain the interpretive execution approach, making it highly flexible and suitable for specific scenarios.

