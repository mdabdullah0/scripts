    import java.util.*;
    public class automorphic 
    {  
    public static void main(String args[])   
      {  
    int n,temp,d=0,sqr,x;
    Scanner sc=new Scanner(System.in);
    System.out.println("Enter the number");
    n=sc.nextInt();
    temp=n;
    sqr=n*n;
    while(n>0)
    {
    d++;
    n=n/10;
    }
        x=(int)Math.pow(10.0,(double)d);
        if(sqr%x==temp)
        System.out.println("AUTOMORPHIC NUMBER");  
        else
        System.out.println("NOT AN AUTOMORPHIC NUMBER");
        
      }  
    }  
