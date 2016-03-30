public class ex_1_1_3{
        public static boolean compare(int[] a){
                if (a[0] == a[1] && a[1] == a[2]) {
                        System.out.println("equal");
                        return true;
                }else {
                        System.out.println("no equal");
                        return false;
                }
        }

        public static void main(String[] args{
                int[] a = StdIn.readInts();
                compare(a);
        }
}
