using System;
using System.Collections.Generic;
using System.Diagnostics;

public class PrimeCalculator
{
    public static bool IsPrime(int number)
    {
        if (number <= 1)
            return false;
        if (number == 2)
            return true;
        if (number % 2 == 0)
            return false;
        for (int i = 3; i <= Math.Sqrt(number); i += 2)
        {
            if (number % i == 0)
                return false;
        }
        return true;
    }

    public static List<int> FindPrimes()
    {
        List<int> primes = new List<int>();
        int n = (int)(Math.Pow(2, 20) - 1);
        for (int i = 2; i < n; i++)
        {
            if (IsPrime(i))
                primes.Add(i);
        }
        return primes;
    }

    public static void Main()
    {
        Stopwatch stopwatch = new Stopwatch();
        stopwatch.Start();

        int iterations = 10;
        for (int i = 0; i < iterations; i++)
        {
            List<int> primesList = FindPrimes();
            Console.WriteLine($"Iteration {i+1}: Prime count: {primesList.Count}");
        }

        stopwatch.Stop();
        TimeSpan totalTime = stopwatch.Elapsed;
        Console.WriteLine($"Total Time: {totalTime.TotalMilliseconds} ms");
    }
}