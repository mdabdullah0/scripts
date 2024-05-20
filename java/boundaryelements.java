import java.util.*;
    class boundaryelements
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
        
        
        System.out.println("the boundary elements of matrix are");
           for(int i=0;i<r;i++)
           {
              for(int j=0;j<c;j++)
            {
            if((i==0)||(j==0)||(i==(r-1))||(j==(c-1)))
            
                
               System.out.print(a[i][j]+"\t");
               else
            System.out.print("  \t");
            }
                
        System.out.println();
           }
        }
     }
