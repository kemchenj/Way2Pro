public class test{
        public static void main(String[] args) {
                int f=0;
                int g=1;
                for (int i=0; i<=15; i++) {
                        StdOut.printf("%d次:f = %d\t", i, f);
                        StdOut.printf("g = %d\n", g);
                        f = f + g;
                        g = f - g;
                }
        }
}
