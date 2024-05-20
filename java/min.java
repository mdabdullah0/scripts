import java.util.*;
class min
{
public static void main(String args[])
{
    Scanner sc=new Scanner(System.in);
     System.out.println("enter the array elements");
      int a[]=new int[10];
        for(int i=0;i<10;i++)
        a[i]=sc.nextInt();
       int min=a[0];

          for(int i=0;i<10;i++)
      {
        if(a[i]<min)
         min=a[i];
         }
System.out.println("minimum:\n"+min);
     }
}
