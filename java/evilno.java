    import java.util.*;
    public class evilno 
    {  
    public static void main(String args[])   
      {  
    int n,ds=0,r;
    Scanner sc=new Scanner(System.in);
    System.out.println("Enter the number");
    n=sc.nextInt();
    while(n>0)
    {
    r=n%2;
    ds=ds+r;
    n=n/2;
     }
     
        if(ds%2==0)
        System.out.println("EVIL NUMBER");  
        else
        System.out.println("NOT AT EVIL NUMBER");
        
      }  
    }  
