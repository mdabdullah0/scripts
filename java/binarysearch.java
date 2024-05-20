import java.util.*;
class binarysearch
{
public static void main(String[] args)
{
Scanner sc=new Scanner(System.in);
System.out.println("enter the size of array");
int N=sc.nextInt();
int a[]=new int[N];
int first=0;
int last=N-1;
int mid =(first+last)/2;


System.out.println("enter the elements in array");
for(int i=0;i<N;i++)
{
a[i]=sc.nextInt();
}

System.out.println("enter the number to be searched");
int search=sc.nextInt();

while(first<=last)
{
if(a[mid]<search)
{
first=mid+1;
}

else if(a[mid]==search)
{
System.out.println("the searched element is present at index no"+mid);
break;
}

else
{
last=mid-1;
}
mid=(first+last)/2;
}
if(first>last)
{
System.out.println("NUMBER NOT FOUND");
}
}
}
