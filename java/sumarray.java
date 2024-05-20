import java.util.*;
class sumarray
{
public static void main(String args[])
{


int n;
    Scanner sc=new Scanner(System.in);
    System.out.println("enter the number of elements");
    n=sc.nextInt();//number of elements
    int a[]=new int[n];
     System.out.println("enter the array elements");
        for(int i=0;i<n;i++)
        a[i]=sc.nextInt();//storing elements in array
       int sume=0;//sum of even
       int sumo=0;//sum of odd

          for(int i=0;i<n;i++)
      {
        if(a[i]%2==0)
         sume=sume+a[i];
         else 
         sumo=sumo+a[i];
         
         
         }
System.out.println("sum of even elements in the entered array:"+sume);
System.out.println("sum of odd elements in the entered array:"+sumo);
     }
}
