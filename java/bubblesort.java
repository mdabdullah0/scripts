import java.util.*;
class bubblesort
{
public static void main(String[] args)
{
Scanner sc=new Scanner(System.in);
int sz,temp;//sz:for size of array & temp: for storing elements on temporary location
System.out.println("enter the size of array:");
sz=sc.nextInt();//number of elements in array
int a[]=new int[sz];//a[]: array whose elements are to be sorted

System.out.print("enter the elements of array:\n");
for(int i=0;i<sz;i++)
a[i]=sc.nextInt();

for(int i=0;i<sz-1;i++)
{
for(int j=0;j<sz-i-1;j++)
{
if(a[j]>a[j+1])
{
temp=a[j];
a[j]=a[j+1];
a[j+1]=temp;
}
}
}
System.out.println("SORTED LIST IS");
for(int k=0;k<sz;k++)
System.out.print(a[k]+",");//sorted array
}
}
