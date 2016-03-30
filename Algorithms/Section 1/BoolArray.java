public class BoolArray{
        public static void main(String[] args) {
                char a[][] = new char[5][5];
                for (int i=0; i<5; i++) {
                        for (int j=0; j<5; j++) {
                                int temp = StdRandom.uniform(99)%2;
                                if (temp == 0) {
                                        a[i][j] ='*';
                                }else{
                                        a[i][j] =' ';
                                }
                        }
                }
                for (int i=0; i<5; i++) {
                        for (int j=0; j<5; j++) {
                                System.out.printf("%c", a[i][j]);
                        }
                        System.out.printf("\n");
                }
        }
}
