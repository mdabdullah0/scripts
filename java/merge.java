import java.util.*;

class merge
{
   public static void main(String[] args)
   {
      int i, k=0;
      int c[]= new int[100];
      Scanner sc= new Scanner(System.in);
      
      System.out.print("Enter the size of first array: ");
      int x = sc.nextInt();//number of elements in first array
      int a[]  = new int[x];
      System.out.print("Enter " +x+ " elements for first array:\n");
      for(i=0; i<x; i++)
      {
         a[i] = sc.nextInt();
         c[k] = a[i];
         k++;
      }
      System.out.print("\nEnter the size of second array: ");
      int y = sc.nextInt();//number of elements in second array
      int b[] = new int[y];
      System.out.print("Enter " +y+ " elements for second array:\n ");
      for(i=0; i<y; i++)
      {
         b[i] = sc.nextInt();
         c[k] = b[i];
         k++;
      }
      
      System.out.println("\nThe merged array is: ");
      for(i=0; i<k; i++)
         System.out.print(c[i]+ " ");//final array after merging
   }
}
