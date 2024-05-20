import java.util.*;
class spy
{
int n,D,P=1,S=0;
public static void main(String arggs[])
{
spy obj=new spy();
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
while(n>0)
{
D=n%10;
S=S+D;
P=P*D;
n=n/10;
}
}
void display()
{
if(S==P)

System.out.println("IT IS A SPY NUMBER");
else
System.out.println("NOT A SPY NUMBER");
}
}
