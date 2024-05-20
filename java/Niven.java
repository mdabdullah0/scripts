import java.util.*;
class Niven
{
int n,d,s=0;
public static void main(String args[])
{
Niven obj=new Niven();
obj.input();
obj.calculate();
obj.check();
}
void input()
{
Scanner sc=new Scanner(System.in);
System.out.println("Enter the number");
n=sc.nextInt();
}
void calculate()
{
while(n!=0)
{
d=n%10;
s=s+d;
n=n/10;
}
}
void check()
{
if(n%s==0)
System.out.println("NIVEN NUMBER");
else
System.out.println("NOT A NIVEN NUMBER");
}
}
