import java.util.*;
    class watermatrix
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
        
        System.out.println("the water matrix is");
           for(int i=r-1;i>=0;i--)
           {
              for(int j=0;j<c;j++)
            {
               System.out.print(a[i][j]+"\t");
            }
        System.out.println();
           }
        }
     }
