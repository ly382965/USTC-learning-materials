#include <iostream>
#include <fstream>
#include <time.h>
#include <stdlib.h>
#include <ctime>
#define N 100000
using namespace std;
int partition_fixed(int* A,int p,int r);
int partition_random(int* A,int p,int r);
int partition_mid(int* A,int p,int r);
void quicksort_fixed(int* A,int p,int r);
void quicksort_random(int* A,int p,int r);
void quicksort_mid(int* A,int p,int r);
void quicksort_presort(int* A,int p,int r,int k);
void quicksort_insertsort(int* A,int p,int r,int k);
void bubblesort(int* A,int p,int r);
int main()
{
    srand((unsigned)time(NULL));

    int num[N]={0};
    int i=0;
    int size=0;
    //fixed
    ifstream  fin("./data.txt",ios::in);
    fin >> size;
    while (!fin.eof() && i < size)
	{
		fin >> num[i];
		i++;
	}
    // Start measuring time
    struct timespec begin, end; 
    clock_gettime(CLOCK_REALTIME, &begin);

    quicksort_fixed(num,0,size-1);
    //quicksort_random(num,0,size-1);
    //quicksort_mid(num,0,size-1);
    //quicksort_insertsort(num,0,size-1,10);

    // Stop measuring time and calculate the time
    clock_gettime(CLOCK_REALTIME, &end);
    long seconds = end.tv_sec - begin.tv_sec;
    long nanoseconds = end.tv_nsec - begin.tv_nsec;
    double times = seconds + nanoseconds*1e-9;

    cout<<"Time measured(fixed) "<< times <<" seconds"<<endl;

    //random
    i=0;
    ifstream  fin1("./data.txt",ios::in);
    fin1 >> size;
    while (!fin1.eof() && i < size)
	{
		fin1 >> num[i];
		i++;
	}
    clock_gettime(CLOCK_REALTIME, &begin);

    quicksort_random(num,0,size-1);

    clock_gettime(CLOCK_REALTIME, &end);
    seconds = end.tv_sec - begin.tv_sec;
    nanoseconds = end.tv_nsec - begin.tv_nsec;
    times = seconds + nanoseconds*1e-9;
    cout<<"Time measured(random)"<< times <<" seconds"<<endl;

    //mid
    i=0;
    ifstream  fin2("./data.txt",ios::in);
    fin2 >> size;
    while (!fin2.eof() && i < size)
	{
		fin2 >> num[i];
		i++;
	}
    clock_gettime(CLOCK_REALTIME, &begin);

    quicksort_mid(num,0,size-1);
    clock_gettime(CLOCK_REALTIME, &end);
    seconds = end.tv_sec - begin.tv_sec;
    nanoseconds = end.tv_nsec - begin.tv_nsec;
    times = seconds + nanoseconds*1e-9;
    cout<<"Time measured(mid) "<< times <<" seconds"<<endl;

    //insertsort
    i=0;
    ifstream  fin3("./data.txt",ios::in);
    fin3 >> size;
    while (!fin3.eof() && i < size)
	{
		fin3 >> num[i];
		i++;
	}
    clock_gettime(CLOCK_REALTIME, &begin);

    quicksort_insertsort(num,0,size-1,10);

    clock_gettime(CLOCK_REALTIME, &end);
    seconds = end.tv_sec - begin.tv_sec;
    nanoseconds = end.tv_nsec - begin.tv_nsec;
    times = seconds + nanoseconds*1e-9;
    cout<<"Time measured(quicksort_insertsort) "<< times <<" seconds"<<endl;
    //fout
    ofstream fout;
	fout.open("./out.txt", ios::out);
    for (i = 0; i < size; i++)
    {
        fout<< num[i]<<" ";
    }
    //bubblesort
    i=0;
    ifstream  fin4("./data.txt",ios::in);
    fin4 >> size;
    while (!fin4.eof() && i < size)
	{
		fin4 >> num[i];
		i++;
	}
    clock_gettime(CLOCK_REALTIME, &begin);

    bubblesort(num,0,size-1);

    clock_gettime(CLOCK_REALTIME, &end);
    seconds = end.tv_sec - begin.tv_sec;
    nanoseconds = end.tv_nsec - begin.tv_nsec;
    times = seconds + nanoseconds*1e-9;
    cout<<"Time measured(bubblesort) "<< times <<" seconds"<<endl;


    
    system("pause");
    return 0;
}

void quicksort_fixed(int* A,int p,int r)
{
    int q=0;
    if(p<r)
    {
        q=partition_fixed(A,p,r);
        quicksort_fixed(A,p,q-1);
        quicksort_fixed(A,q+1,r);
    }
}

int partition_fixed(int* A,int p,int r)
{
    int x=A[r];
    int i=p-1;
    int mid=0;
    for(int j=p;j<r;j++)
    {
        if(A[j]<=x)
        {
            i=i+1;
            mid=A[i];
            A[i]=A[j];
            A[j]=mid;
        }
    }
    mid=A[i+1];
    A[i+1]=A[r];
    A[r]=mid;
    return i+1;
}

void quicksort_random(int* A,int p,int r)
{
    int q=0;
    if(p<r)
    {
        q=partition_random(A,p,r);
        quicksort_random(A,p,q-1);
        quicksort_random(A,q+1,r);
    }
}

int partition_random(int* A,int p,int r)
{
    int i = rand() % (r-p+1) + p;
    int mid;
    mid=A[i];
    A[i]=A[r];
    A[r]=mid;
    return partition_fixed(A,p,r);
}

void quicksort_mid(int* A,int p,int r)
{
    int q=0;
    if(p<r)
    {
        q=partition_mid(A,p,r);
        quicksort_mid(A,p,q-1);
        quicksort_mid(A,q+1,r);
    }
}

int partition_mid(int* A,int p,int r)
{
    int i=(p+r)/2;
    int mid;
    mid=A[i];
    A[i]=A[r];
    A[r]=mid;
    return partition_fixed(A,p,r);
}

void quicksort_presort(int* A,int p,int r,int k)
{
    int q=0;
    if(r-p>k)
    {
        q=partition_fixed(A,p,r);
        quicksort_presort(A,p,q-1,k);
        quicksort_presort(A,q+1,r,k);
    }
}

void quicksort_insertsort(int* A,int p,int r,int k)
{
    quicksort_presort(A,p,r,k);
    int key=0;
    int j=0;
    for(int i=p+1;i<r;i++)
    {
        key=A[i];
        for(j=i-1;j>p;j--)
        {
            if(A[j]>key)
            {
                A[j+1]=A[j];
            }
            else
            {
                break;
            }
        }
        A[j+1]=key;
    }
}

void bubblesort(int* A,int p,int r)
{
    int mid;
    for (int i = p; i < r; i++)
    {
        for (int j = p; j < r+p-i-1; j++)
        {
            if(A[j]>A[j+1])
            {
                mid=A[j];
                A[j]=A[j+1];
                A[j+1]=mid;
            }
        }
        
    }
    
}