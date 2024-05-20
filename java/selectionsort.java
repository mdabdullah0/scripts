import java.util.*;
class selectionsort
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

for(int i=0;i<sz;i++)
{
for(int j=i+1;j<sz;j++)
{
if(a[i]>a[j])
{
temp=a[i];
a[i]=a[j];
a[j]=temp;
}
}
}
System.out.println("SORTED LIST IS");
for(int k=0;k<sz;k++)
System.out.print(a[k]+",");//sorted array
}
}
