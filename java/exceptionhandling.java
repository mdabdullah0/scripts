public class exceptionhandling
{
public static void main(String args[])
{
int result = division(100,10);
result = division(100,0);
System.out.println("result"+result);
}
public static int division(int num1,int num2)
{
int quotient=-1;
System.out.println("computing division");
try{
   quotient=num1/num2;
   }
   catch(Exception e)
   {
   System.out.println("exception"+e.getMessage());
   }
   finally{
     if(quotient!=-1)
     {
     System.out.println("no exception");
     System.out.println("result"+quotient);
     }
     else
     {
       System.out.println("exception occured");
       }
       }
       return quotient;
       }
       }
       
