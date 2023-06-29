# py_optimize
Python优化演示项目，通过一系列例程，演示 Cython, Numba, Numpy 等优化方案。
此项目也包括了 C# 和 Java 版本的对比程序。
此项目的目的是计算 2 ~ 2^20 之间所有的质数。

## 源码说明

源码文件 | 说明
---- | ----
test.cs | C# 对标版本
Test.java | Java 对比版本
test1.py | 纯 python 无优化
test2.py | Cython 优化版测试入口
test2.pyx | 纯 python 直接复制，不添加任何类型信息
test2_1.pyx | 添加参数、返回值、局部变量类型信息
test2_2.pyx | 使用 C 版本 math.sqrt 函数
test2_3.pyx | 把 list 改为 numpy 数组，并使用内存视图直接以指针访问数组成员
test3.py | 使用 numba，仅优化 is_prime 函数
test3_1.py | 使用 numba 对 find_primes 函数优化，并将 Python 列表替换成 Numba 的内置列表类型
setup.py | Cython 构建脚本，这里使用 anotate=True 打开了注解模式，编译后生成一个html文件，供开发者快速定位性能瓶颈

## 测试结果

版本 | 执行时间 | 标准速率比
---- | ----- | -----
C# | 约 0.9s | 100%
Java | 约 0.93s | 103%
纯 Python | 约 24s | 2667%
Python 直接转 Cython | 约 15s | 1667%
Cython 添加类型 | 约 1.72s | 191%
Cython 使用C版本sqrt函数 | 约 0.96s | 107%
Cython 使用 Numpy 内存视图 | 约 0.87s | 97%
Numba 仅优化 is_prime | 约 2.7s | 300%
Numba 优化列表类型 | 约 1.04s | 115%

## 结论
1. C# 和 Java 的 JIT 虚拟机相当给力，Python 使用 Cython 优化到极致基本打平这两种虚拟机语言；
2. 一行代码不改，仅仅将 python 源码从解释执行转成编译执行，就能提升 至少20%性能，还能实现代码加密，没有理由不在发行版中作此处理；
3. Cython 可实现渐进的、局部的优化，在 Python 基础上学习少量新知识即可实现数量级级别的巨大性能提升，不像很多其它语言的本地化优化手段，需要学习新的语言、语法；
4. 使用 cProfile 分析出性能瓶颈后，直接针对影响最大的部分进行局部优化，简单添加参数、返回值、局部变量的类型即可取得极佳效果；
5. 主要的瓶颈之一，在于Python对象和C类型的转换，尽可能使用 C 函数可最大化减少此类转换；
6. 使用 Numpy 无需管理内存的分配和释放，因此 Numpy 数组 + 内存视图可在性能和复杂间达到最佳平衡点；
7. 本例子的结果列表数据量比较小，而且无需处理，未体现Numpy的超强功能和性能，Numpy 才是 Python 的杀手级框架；
8. Numba 的应用局限性比较大，且存在首次调用开销，但无需编译，可保留解释方式执行，非常灵活，适用于特定场景。
