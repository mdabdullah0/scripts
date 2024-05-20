import java.util.*;
class max
{
public static void main(String args[])
{
    Scanner sc=new Scanner(System.in);
     System.out.println("enter the array elements");
      int a[]=new int[10];
        for(int i=0;i<10;i++)
        a[i]=sc.nextInt();
       int max=a[0];

          for(int i=0;i<10;i++)
      {
        if(a[i]>max)
         max=a[i];
         }
System.out.println("maximum:\n"+max);
     }
}
