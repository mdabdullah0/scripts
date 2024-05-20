import java.util.*;
class Neon
{
int n,s,sum=0,D;
public static void main(String args[])
{
Neon obj=new Neon();
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
s=n*n;
while(s!=0)
{
D=s%10;
sum=sum+D;
s=s/10;
}
}
void check()
{
if(n==sum)
System.out.println("NEON NUMBER");
else
System.out.println("NOT A NEON NUMBER");
}
}
