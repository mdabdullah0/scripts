    import java.util.*;
    public class Happy 
    {  
    public static void main(String args[])   
      {  
    int n,d,ds;
    Scanner sc=new Scanner(System.in);
    System.out.println("Enter the number");
    n=sc.nextInt();
    while(n>9)
    {
    ds=0;
    while(n>0)
        {
           d=n%10;
            ds=ds+d*d;
             n=n/10;
        }
      n=ds;
      
     }
        if(n==1)
        System.out.println("HAPPY NUMBER");  
        else
        System.out.println("NOT AT HAPPY NUMBER");
        
      }  
    }  
