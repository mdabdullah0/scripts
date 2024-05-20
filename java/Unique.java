    import java.util.*;
    public class Unique
    {  
    public static void main(String args[])   
      {  
    int n,d,t,m,c=0,s=0;
    Scanner sc=new Scanner(System.in);
    System.out.println("Enter the number");
    n=sc.nextInt();
    t=n;
    m=n;
    while(n>0)
    {
    d=n%10;
    t=m;
    
    while(t>0)
        {
           if(d==t%10)
            s++;
             t=t/10;
        }
      n=n/10;
      c++;
      
     }
        if(s==c)
        System.out.println("UNIQUE NUMBER");  
        else
        System.out.println("NOT AT UNIQUE NUMBER");
        
      }  
    }  
