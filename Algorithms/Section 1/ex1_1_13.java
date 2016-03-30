public class ex1_1_13{
        public static void main(String[] args) {
                int N=5;
                int M=11;

                int[][] a = new int[N][M];
                System.out.printf("初始状态\n");

                for (int i=0; i<N; i++) {
                        for (int j=0; j<M; j++) {
                                a[i][j] = (int)StdRandom.uniform(99);
                                System.out.printf("%d\t", a[i][j]);
                        }
                        System.out.println("\n");
                }

                System.out.printf("重排后：\n");
                for (int j=0; j<M; j++) {
                        for (int i=0; i<N; i++) {
                                System.out.printf("%d\t", a[i][j]);
                        }
                        System.out.println("\n");
                }
        }
}
