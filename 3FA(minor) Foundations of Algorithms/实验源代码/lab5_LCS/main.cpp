#include <iostream>
#include <string.h>
#include <stdlib.h>
using namespace std;
#define N 100
enum direction{
    NONE,
    UP,
    LEFT,
    LEFTUP
};
int LCS_length(char* X,char* Y,int **b,int m,int n);
void print_LCS(int **b,char* X,int i,int j);
int LCS_length_2(char* X, char* Y, int m, int n);
int LCS_length_3(char* X, char* Y, int m, int n);
int main()
{
    char text1[N]="\0";
    char text2[N]="\0";
    cout<<"输入text1:";
    cin>>text1;
    cout<<"输入text2:";
    cin>>text2;
    int m=strlen(text1);
    int n=strlen(text2);
    if(n>m)
    {
        swap(text1,text2);
        swap(m,n);
    }
    int **b1 = new int *[m+1];
    for(int i = 0; i < m+1; i++)
    {
        b1[i] = new int[n+1](NONE);
    }
    int **b2 = new int *[m+1];
    for(int i = 0; i < m+1; i++)
    {
        b2[i] = new int[n+1](NONE);
    }
    int **b3 = new int *[m+1];
    for(int i = 0; i < m+1; i++)
    {
        b3[i] = new int[n+1](NONE);
    }
    cout<<"1"<<endl;
    int t=0;
    t=LCS_length(text1,text2,b1,m,n);
    if(t!=0)
    {
        cout<<"LCS:";
        print_LCS(b1,text1,m,n);
        cout<<","<<"长度:"<<t<<endl;
    }
    else
    {
        cout<<"0"<<endl;
    }

    cout<<"2"<<endl;

    t=LCS_length_2(text1,text2,m,n);
    if(t!=0)
    {
        cout<<"LCS:";
        cout<<"长度:"<<t<<endl;
    }
    else
    {
        cout<<"0"<<endl;
    }

    cout<<"3"<<endl;
    t=LCS_length_3(text1,text2,m,n);
    if(t!=0)
    {
        cout<<"LCS:";
        cout<<"长度:"<<t<<endl;
    }
    else
    {
        cout<<"0"<<endl;
    }
    system("pause");
    return 0;
}
int LCS_length(char* X,char* Y,int **b,int m,int n)
{
    int **c = new int *[m+1];
    for(int i = 0; i < m+1; i++)
    {
        c[i] = new int[n+1](0);
    }
    for (int i = 0; i <= m; i++)
    {
        c[i][0]=0;
    }
    for (int j = 0; j <= n; j++)
    {
        c[0][j]=0;
    }
    for (int i = 1; i <= m; i++)
    {
        for (int j = 1; j <= n; j++)
        {
            if(X[i-1]==Y[j-1])
            {
                c[i][j]=c[i-1][j-1]+1;
                b[i][j]=LEFTUP;
            }
            else if(c[i-1][j]>=c[i][j-1]) 
            {
                c[i][j]=c[i-1][j];
                b[i][j]=UP;
            }
            else
            {
                c[i][j]=c[i][j-1];
                b[i][j]=LEFT;
            }
        }
    }
    return c[m][n];
}
void print_LCS(int **b,char* X,int i,int j)
{
    if(i==0 || j==0)
    {
        return;
    }
    if(b[i][j]==LEFTUP)
    {
        print_LCS(b,X,i-1,j-1);
        cout<<X[i-1];
    }
    else if(b[i][j]==UP)
    {
        print_LCS(b,X,i-1,j);
    }
    else if(b[i][j]==LEFT)
    {
        print_LCS(b,X,i,j-1);
    }
}

int LCS_length_2(char* X, char* Y, int m, int n) {
    int* prow = new int[n+1](0);
    int* crow = new int[n+1](0);

    for (int i = 1; i <= m; i++) 
    {
        for (int j = 1; j <= n; j++) 
        {
            if (X[i-1]==Y[j-1]) 
            {
                crow[j]=prow[j-1]+1;
            }
            else if (prow[j]>=crow[j-1]) 
            {
                crow[j]=prow[j];
            }
            else 
            {
                crow[j]=crow[j-1];
            }
        }
        swap(prow, crow);
    }
    return prow[n];
}
//c[i−1,j] c[i−1,j−1] c[i,j−1]
int LCS_length_3(char* X, char* Y, int m, int n) 
{
    int *row = new int[n+1](0);
    int c_i_1_j_1 = 0;  // 保存对角元素 c[i-1][j-1]

    for (int i = 1; i <= m; i++) 
    {
        c_i_1_j_1 = 0; 
        for (int j = 1; j <= n; j++) 
        {
            int c_i_j = row[j];
            if (X[i-1] == Y[j-1]) 
            {
                row[j] = c_i_1_j_1+1;
            } 
            else if (row[j] < row[j - 1]) 
            {
                row[j] = row[j-1];
            } 
            c_i_1_j_1 = c_i_j;
        }
    }
    return row[n];
}
