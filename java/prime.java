import java.util.*;
public class prime
{
public static void main (String args[])
{
int n,c=0,i;
Scanner sc=new Scanner(System.in);

System.out.println("enter the number");
n=sc.nextInt();
for(i=2;i<n;i++)
{
if(n%i==0)
{
c++;
break;
}
}
if(c==0)
System.out.println("PRIME NUMBER");
else
System.out.println("NOT A PRIME NUMBER");
}
}
