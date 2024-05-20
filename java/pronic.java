    import java.util.*;
    public class pronic 
    {  
    public static void main(String args[])   
      {  
    int n,s=0;
    Scanner sc=new Scanner(System.in);
    System.out.println("Enter the number");
    n=sc.nextInt();
    for(int i=1;i<n;i++)
    {
    if(i*(i+1)==n)
    {
    s=1;
    break;
     }
     }
        if(s==1)
        System.out.println("PRONIC NUMBER");  
        else
        System.out.println("NOT AT PRONIC NUMBER");
        
      }  
    }  
