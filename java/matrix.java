import java.util.*;
    class matrix
    {
    public static void main(String[] args)
    {
    Scanner sc=new Scanner(System.in);
    int r ,c;
    System.out.println("enter the number of rows");
    r=sc.nextInt();
    System.out.println("enter the number of columns");
    c=sc.nextInt();
    int a[][]=new int[r][c];
    
    
    System.out.println("enter the elements in matrix");
    for(int i=0;i<r;i++)
    {
      for(int j=0;j<c;j++)
      {
        a[i][j]=sc.nextInt();
        }
        }
        
        System.out.println("the entered matrix is");
        for(int i=0;i<r;i++)
        {
      for(int j=0;j<c;j++)
        {
        System.out.print(a[i][j]+"\t");
        }
        System.out.println();
        }
        System.out.println("the mirror matrix is");
        for(int i=0;i<r;i++)
        {
      for(int j=c-1;j>=0;j--)
        {
        System.out.print(a[i][j]+"\t");
        }
        System.out.println();
        
        }
        }
