#include <iostream>
#include <stdio.h>
#include <stdlib.h>
using namespace std;
#include "sqstack.h"
#include "linkqueue.h"
int main()
{
    SqStack parking;
    InitStack_sq(parking);
    LinkQueue road;
    InitQueue_L(road);
    char order='\0';
    int carID=0,time=0;
    int n=0,m=0,p=0;
    cout<<"输入停车场可以停放的车辆数量n：";
    cin>>n;
    cout<<"输入等候队列最大长度m：";
    cin>>m;
    cout<<"输入停车价格p：";
    cin>>p;
    getchar();
    SElemType carID_1=0;
    SElemType time_1=0;
    SqStack buffer;
    InitStack_sq(buffer);
    int StackLength=0,QueueLength=0;
    while(1)
    {
        cout<<"输入命令：";
        scanf("(%c,%d,%d)",&order,&carID,&time);
        getchar();
        switch (order)
        {
        case 'A':
            StackLength=StackLength_sq(parking);
            QueueLength=QueueLength_L(road);
            if(StackLength<n)
            {
                Push_sq(parking,carID,time);
                cout<<"在停车场中位置为："<<StackLength+1<<endl;
            }
            else if(QueueLength<m)
            {
                EnQueue_L(road,carID,time);
                 cout<<"在候车场中位置为："<<QueueLength+1<<endl;
            }
            else
            {
                cout<<"停车场和候车场均已满";
            }
            break;
        case 'D':
            
            while(StackLength_sq(parking)>0)
            {
                Pop_sq(parking,carID_1,time_1);
                if(carID_1==carID)
                {
                    cout<<"停车时间为"<<time-time_1<<endl;
                    cout<<"缴纳费用为"<<(time-time_1)*p<<endl;
                }
                else
                {
                    Push_sq(buffer,carID_1,time_1);
                }
            }
            for(int i=0;i<QueueLength_L(road);i++)
            {
                DeQueue_L(road,carID_1,time_1);
                if(carID_1==carID)
                {
                    cout<<"停车时间为0"<<endl;
                    cout<<"缴纳费用为0"<<endl;
                }
                else
                {
                    EnQueue_L(road,carID_1,time_1);
                }
            }
            while(StackLength_sq(buffer)>0)
            {
                Pop_sq(buffer,carID_1,time_1);
                Push_sq(parking,carID_1,time_1);
            }
            if(StackLength_sq(parking)<n&&QueueLength_L(road)>0)
            {
                DeQueue_L(road,carID_1,time_1);
                Push_sq(parking,carID_1,time);
            }
            break;
        case 'E':
            return 0;
            break;
        case 'P':
            StackTraverse_sq(parking);
            break;
        case 'W':
            QueueTraverse_L(road);
            break;
        default:
            cout<<"请输入正确的符号！"<<endl;
            break;
        }

    }
    return 0;
}