import java.util.*;
class countevenodd
{
public static void main(String args[])
{
int n;
int ce=0;//for counting even elements
int co=0;//for counting odd elements
    Scanner sc=new Scanner(System.in);
    System.out.println("enter the number of elements");
    n=sc.nextInt();//number of elements
    int a[]=new int[n];
    
     System.out.println("enter the array elements");
        for(int i=0;i<n;i++)
        a[i]=sc.nextInt();//storing elements in array
       
          for(int i=0;i<n;i++)
      {
        if(a[i]%2==0)
         ce++;
         else 
         co++;
         
         
         }
System.out.println("number of even elements in the entered array:"+ce);
System.out.println("number of odd elements in the entered array:"+co);
     }
}
