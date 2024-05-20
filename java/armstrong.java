import java.util.*;
class armstrong
{
int n,cs=0,R,T;
public static void main(String args[])
{
armstrong obj=new armstrong();
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
T=n;
while(n!=0)
{
R=n%10;
cs=cs+(R*R*R);
n=n/10;
}
}
void check()
{
if(T==cs)
System.out.println("ARMSTRONG NUMBER");
else
System.out.println("NOT A ARMSTRONG NUMBER");
}
}
