public class ogili{
        public static int gcd(int p, int q){
                if(q==0) return p;
                int r = p % q;
                return gcd(q, r);
        }
        public static void main(String[] args) {
                int a = 784264;
                int b = 804064;
                System.out.printf("%d和%d的最大公约数：%d\n", a, b, gcd(a, b));
                return;
        }
}
