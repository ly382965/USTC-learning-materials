#include <iostream>
#include <fstream>
#include <math.h>
#define N 10000
#define MAX 100000
using namespace std;
#include <stdlib.h>
#include <float.h>
#include <time.h>

struct minlength
{
    float delta;
    int point1;
    int point2;
};

void quicksort_fixed_x(float (*A)[3],int p,int r);
int partition_fixed_x(float (*A)[3],int p,int r);
void quicksort_fixed_y(float (*A)[3],int p,int r);
int partition_fixed_y(float (*A)[3],int p,int r);
float distance(float x1,float x2,float y1,float y2);
struct minlength nearpoint(float (*X)[3],float (*Y)[3],int p,int r);
struct minlength normal(float (*X)[3]);

int main()
{
    srand((unsigned)time(NULL));

    float X[N][3]={{0.0}};
    float Y[N][3]={{0.0}};
    float Z[N][3]={{0.0}};
    struct minlength min;
    struct minlength min2;
    ifstream  fin("./data.txt",ios::in);
    int i=0;
    while (!fin.eof() && i < N)
	{
        fin >> i;
        X[i][2]=(float)i;
		fin >> X[i][0] >> X[i][1];
        Y[i][0]=X[i][0];
        Y[i][1]=X[i][1];
        Y[i][2]=X[i][2];
        Z[i][0]=X[i][0];
        Z[i][1]=X[i][1];
        Z[i][2]=X[i][2];
	}
    //normal
    // Start measuring time
    struct timespec begin, end; 
    clock_gettime(CLOCK_REALTIME, &begin);
    min2=normal(X);
    // Stop measuring time and calculate the time
    clock_gettime(CLOCK_REALTIME, &end);
    long seconds = end.tv_sec - begin.tv_sec;
    long nanoseconds = end.tv_nsec - begin.tv_nsec;
    double times = seconds + nanoseconds*1e-9;

    cout<<"trivial algorithm:"<<endl;
    cout<<"delta:"<<min2.delta<<endl;
    cout<<"point1:"<<min2.point1<<"("<<Z[min2.point1][0]<<","<<Z[min2.point1][1]<<")"<<endl;
    cout<<"point2:"<<min2.point2<<"("<<Z[min2.point2][0]<<","<<Z[min2.point2][1]<<")"<<endl;
    cout<<"Time measured(fixed) "<< times <<" seconds"<<endl;

    // Start measuring time
    clock_gettime(CLOCK_REALTIME, &begin);
    //presort
    quicksort_fixed_x(X,0,N-1);
    quicksort_fixed_y(Y,0,N-1);
    min=nearpoint(X,Y,0,N-1);
    clock_gettime(CLOCK_REALTIME, &end);
    seconds = end.tv_sec - begin.tv_sec;
    nanoseconds = end.tv_nsec - begin.tv_nsec;
    times = seconds + nanoseconds*1e-9;

    cout<<"my algorithm:"<<endl;
    cout<<"delta:"<<min.delta<<endl;
    cout<<"point1:"<<min.point1<<"("<<Z[min.point1][0]<<","<<Z[min.point1][1]<<")"<<endl;
    cout<<"point2:"<<min.point2<<"("<<Z[min.point2][0]<<","<<Z[min.point2][1]<<")"<<endl;
    cout<<"Time measured(fixed) "<< times <<" seconds"<<endl;

    system("pause");

    return 0;
}

void quicksort_fixed_x(float (*A)[3],int p,int r)
{
    int q=0;
    if(p<r)
    {
        q=partition_fixed_x(A,p,r);
        quicksort_fixed_x(A,p,q-1);
        quicksort_fixed_x(A,q+1,r);
    }
}

int partition_fixed_x(float (*A)[3],int p,int r)
{
    float x=A[r][0];
    int i=p-1;
    float mid[3]={0};
    for(int j=p;j<r;j++)
    {
        if(A[j][0]<=x)
        {
            i=i+1;
            mid[0]=A[i][0];
            A[i][0]=A[j][0];
            A[j][0]=mid[0];
            mid[1]=A[i][1];
            A[i][1]=A[j][1];
            A[j][1]=mid[1];
            mid[2]=A[i][2];
            A[i][2]=A[j][2];
            A[j][2]=mid[2];
        }
    }
    mid[0]=A[i+1][0];
    A[i+1][0]=A[r][0];
    A[r][0]=mid[0];
    mid[1]=A[i+1][1];
    A[i+1][1]=A[r][1];
    A[r][1]=mid[1];
    mid[2]=A[i+1][2];
    A[i+1][2]=A[r][2];
    A[r][2]=mid[2];
    return i+1;
}

void quicksort_fixed_y(float (*A)[3],int p,int r)
{
    int q=0;
    if(p<r)
    {
        q=partition_fixed_y(A,p,r);
        quicksort_fixed_y(A,p,q-1);
        quicksort_fixed_y(A,q+1,r);
    }
}

int partition_fixed_y(float (*A)[3],int p,int r)
{
    float x=A[r][1];
    int i=p-1;
    float mid[3]={0};
    for(int j=p;j<r;j++)
    {
        if(A[j][1]<=x)
        {
            i=i+1;
            mid[0]=A[i][0];
            A[i][0]=A[j][0];
            A[j][0]=mid[0];
            mid[1]=A[i][1];
            A[i][1]=A[j][1];
            A[j][1]=mid[1];
            mid[2]=A[i][2];
            A[i][2]=A[j][2];
            A[j][2]=mid[2];
        }
    }
    mid[0]=A[i+1][0];
    A[i+1][0]=A[r][0];
    A[r][0]=mid[0];
    mid[1]=A[i+1][1];
    A[i+1][1]=A[r][1];
    A[r][1]=mid[1];
    mid[2]=A[i+1][2];
    A[i+1][2]=A[r][2];
    A[r][2]=mid[2];
    return i+1;
}

struct minlength nearpoint(float (*X)[3],float (*Y)[3],int p,int r)
{
    struct minlength min;
    min.delta=MAX;
    float d=0;
    if(r-p < 3)
    {
        for(int i=p;i<=r;i++)
        {
            for(int j=i+1;j<r;j++)
            {
                d=distance(X[i][0],X[j][0],X[i][1],X[j][1]);
                if(d<min.delta)
                {
                    min.delta=d;
                    min.point1=(int)X[i][2];
                    min.point2=(int)X[j][2];                
                }
            }
        }
    }
    else
    {
        float (*Y2_1)[3] = NULL;
        Y2_1=(float(*)[3])malloc((r-p)/2 * sizeof(float) * 3);
        float (*Y2_2)[3] = NULL;
        Y2_2=(float(*)[3])malloc((r-p)/2 * sizeof(float) * 3);
        float Y3[N][3]={{MAX,MAX,MAX}};
        int i1=0,i2=0;
        for(int i=0;i<r-p;i++)
        {
            if(Y[i][0]<X[(p+r)/2][0])
            {
                Y2_1[i1][0]=Y[i][0];
                Y2_1[i1][1]=Y[i][1];
                Y2_1[i1][2]=Y[i][2];
                i1++;
            }
            else
            {
                Y2_2[i2][0]=Y[i][0];
                Y2_2[i2][1]=Y[i][1];
                Y2_2[i2][2]=Y[i][2];
                i2++;
            }
        }
        struct minlength d1;
        struct minlength d2;
        d1=nearpoint(X,Y2_1,p,(p+r)/2);
        d2=nearpoint(X,Y2_2,(p+r)/2+1,r);
        if(d1.delta < d2.delta)
        {
            min.delta=d1.delta;
            min.point1=d1.point1;
            min.point2=d1.point2;
        }
        else
        {
            min.delta=d2.delta;
            min.point1=d2.point1;
            min.point2=d2.point2;
        }
        int i3=0;
        for(int i=0;i<r-p;i++)
        {
            if(Y[i][0]<X[(p+r)/2][0]+min.delta && Y[i][0]>X[(p+r)/2][0]-min.delta)
            {
                Y3[i3][0]=Y[i][0];
                Y3[i3][1]=Y[i][1];
                Y3[i3][2]=Y[i][2];
                i3++;
            }
        }
        for(int i=0;i<i3-8;i++)
        {
            for(int r=1;r<8;r++)
            {
                d=distance(Y3[i][0],Y3[i+r][0],Y3[i][1],Y3[i+r][1]);
                if(d<min.delta)
                {
                    min.delta=d;
                    min.point1=(int)Y3[i][2];
                    min.point2=(int)Y3[i+r][2];
                }
            }
        }

    }
    return min;
}

float distance(float x1,float x2,float y1,float y2)
{
    return sqrt(pow(x1-x2,2)+pow(y1-y2,2));
}

struct minlength normal(float (*X)[3])
{
    struct minlength min;
    min.delta=MAX;
    for (int i = 0; i < N; i++)
    {
        for (int j = i+1; j < N; j++)
        {
            float d=distance(X[i][0],X[j][0],X[i][1],X[j][1]);
            if(d<min.delta)
            {
                min.point1=i;
                min.point2=j;
                min.delta=d;
            }
        }  
    }
    return min;
}
