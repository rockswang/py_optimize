import java.util.ArrayList;
import java.util.List;

public class Test {

    public static void main(String[] args) {
        int limit = (int) Math.pow(2, 20);

        long startTime = System.currentTimeMillis();
        for (int i = 0; i < 10; i++) {
            List<Integer> primes = findPrimes(limit);
            System.out.println("Primes found: " + primes.size());
        }
        long endTime = System.currentTimeMillis();

        System.out.println("Total execution time: " + (endTime - startTime) + "ms");
    }

    public static List<Integer> findPrimes(int limit) {
        List<Integer> primes = new ArrayList<>();
        for (int num = 2; num <= limit; num++) {
            if (isPrime(num)) {
                primes.add(num);
            }
        }
        return primes;
    }

    public static boolean isPrime(int num) {
        if (num <= 1) {
            return false;
        }
        if (num == 2) {
            return true;
        }
        if (num % 2 == 0) {
            return false;
        }
        int n = (int) Math.sqrt(num);
        for (int i = 3; i <= n; i += 2) {
            if (num % i == 0) {
                return false;
            }
        }
        return true;
    }

}