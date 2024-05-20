import java.util.*;
class emirp
{
int n,rev,s,t,i,r;
public static void main(String arggs[])
{
emirp obj=new emirp();
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
for(i=1;i<n;i++)
{
if(n%i==0)
s++;
}
while(n!=0)
{
r=n%10;
rev=rev*10+r;
n=n/10;
}
for(i=1;i<rev;i++)
{
if(rev%i==0)
t++;
}
}
void check()
{
if((s==1)&&(t==1))
System.out.println("IT IS EMIRP NUMBER");
else
System.out.println("NOT A EMIRP NUMBER");
}
}
