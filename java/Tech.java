    public class Tech 
    {  
    public static void main(String args[])   
      {  
    int q,r,sum=0;
    System.out.println("Tech numbers between 1 to 1000000 are: ");      
    for (int i = 1; i <= 1000000; i++)   
        {  
     q = i % 100;  
     r = i / 100;  
     sum= q+r;  
     if (i==(sum*sum))  
       System.out.println(i);  
        }  
      }  
    }  
