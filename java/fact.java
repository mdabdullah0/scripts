import java.util.*;
class fact
{
public static void main(String[]args)
{
int f=1,n;
Scanner sc=new Scanner(System.in);
System.out.println("enter a number");
n=sc.nextInt();

while(n!=0)
{
f=f*n;
n--;
}
System.out.println("FACTORIAL"+f);

}
}
