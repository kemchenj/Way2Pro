public class two{
        public static void main(String[] args) {
                int N = StdIn.readInt();
                String s = "";
                for (int n=N; n>0; n = n>>1 ) {
                        s = s + (n&1);
                }
                System.out.println(s);
        }
}
