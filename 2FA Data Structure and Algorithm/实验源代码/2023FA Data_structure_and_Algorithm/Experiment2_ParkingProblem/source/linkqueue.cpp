#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include "linkqueue.h"
using namespace std;
//初始队列
bool InitQueue_L(LinkQueue &Q)
{
Q.front=Q.rear=new LNode;
// 给elem指针动态分配msize长度的数组
if(!Q.front){cerr<<"分配内存错误!"<<endl;return false;}
return true;
}
//销毁队列
void DestroyQueue_L(LinkQueue &Q)
{
while(Q.front){
Q.rear=Q.front->next;
delete Q.front;
Q.front=Q.rear;
}
}
//清空队列
void ClearQueue_L(LinkQueue &Q)
{
QElemType e;
QElemType time;
while(Q.front!=Q.rear)DeQueue_L(Q,e,time);
}
//判断队列是否为空
bool QueueEmpty_L(LinkQueue Q)
{
return (Q.front==Q.rear);
}
//求队列长度
int QueueLength_L(LinkQueue Q)
{
int i=0;
Queueptr p=Q.front;
while(p!=Q.rear){i++;p=p->next;}
return i;
}
//获取队首元素
bool GetHead_L(LinkQueue Q,QElemType &e,QElemType &time)
{
if(Q.front==Q.rear)return false;
e=Q.front->next->data;
time=Q.front->next->time;
return true;
}
//元素入栈
bool EnQueue_L(LinkQueue &Q, QElemType e,QElemType time)
{
Queueptr p=new LNode;
if(!p)return false;
p->data=e;p->time=time;p->next=NULL;
Q.rear->next=p;
Q.rear=p;
return true;
}
//元素出队列
bool DeQueue_L(LinkQueue &Q,QElemType &e,QElemType &time)
{
if(Q.front==Q.rear)return false;
Queueptr p=Q.front->next;
Q.front->next=p->next;
e=p->data;
time=p->time;
if(Q.rear==p)Q.rear=Q.front;
delete p;
return true;
}
//遍历元素
void QueueTraverse_L(LinkQueue Q)
{
Queueptr p=Q.front->next;
while(p){cout<<p->data<<' ';p=p->next;}
cout<<endl;
}