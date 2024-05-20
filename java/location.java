import java.util.*;
  class location
  {
    public static void main(String[] args)
    {
    Scanner sc=new Scanner(System.in);
    int n;
    int a[]=new int[10];
    
    System.out.println("enter the 10 array elements");
    for(int i=0;i<10;i++)
    a[i]=sc.nextInt();
    
    System.out.println("enter the element to be searched");
    n=sc.nextInt();
    
    for(int i=0;i<10;i++)
    {
    if(a[i]==n)
    
      System.out.println("the number is present at location"+(i+1));
      
      }
      }
      }
      
    
