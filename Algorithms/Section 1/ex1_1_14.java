public class ex1_1_14{
        public static int lg(int N){
                int i;
                for (i=0; i*i<=N; i++) {
                }
                return i-1;
        }

        public static void main(String[] args) {
                int M = StdIn.readInt();
                System.out.println(lg(M));
        }
}
