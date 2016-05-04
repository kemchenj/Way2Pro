import java.util.*;

public class ex1_1_15 {
    public static int[] histogram(int[] a, int M) {
        int[] temp = new int[M];
        for (int i = 0; i < M; i++) {
            int k = 0;
            for (int j = 0; j < a.length; j++) {
                if (i == a[j]) {
                    k++;
                }
            }
            temp[i] = k;
        }
        return temp;
    }

    public static String exR1(int n) {
        if (n <= 0) {
            return "";
        }
        return exR1(n - 3) + n + exR1(n - 2) + n;
    }

    public static void main(String[] args) {
        int[] a = {1, 1, 1, 3, 4, 4, 4, 5};
        int[] b = histogram(a, 6);
        int sum = 0;
        for (int i = 0; i < b.length; i++) {
            System.out.println(b[i]);
            sum += b[i];
        }
        System.out.println(sum == a.length);
        System.out.printf("%s", exR1(6));
    }
}
