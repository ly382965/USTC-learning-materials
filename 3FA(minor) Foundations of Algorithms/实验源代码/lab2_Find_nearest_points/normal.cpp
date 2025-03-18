#include <iostream>
#include <fstream>
#include <math.h>
#include <stdlib.h>
#define N 10000
using namespace std;

float distance(float x1,float x2,float y1,float y2);
int main()
{
    float X[N][2]{{0.0}};
    ifstream  fin("./data.txt",ios::in);
    int i=0;
    float delta=10000;
    int point1=0;
    int point2=0;
    while (!fin.eof() && i < N)
	{
        fin >> i;
		fin >> X[i][0] >> X[i][1];
	}
    for (int i = 0; i < N; i++)
    {
        for (int j = i+1; j < N; j++)
        {
            float d=distance(X[i][0],X[j][0],X[i][1],X[j][1]);
            if(d<delta)
            {
                point1=i;
                point2=j;
                delta=d;
            }
        }
        
    }
    cout<<"delta:"<<delta<<endl;
    cout<<"point1:"<<point1<<"("<<X[point1][0]<<","<<X[point1][1]<<")"<<endl;
    cout<<"point2:"<<point2<<"("<<X[point2][0]<<","<<X[point2][1]<<")"<<endl;
    system("pause");
}
float distance(float x1,float x2,float y1,float y2)
{
    return sqrt(pow(x1-x2,2)+pow(y1-y2,2));
}