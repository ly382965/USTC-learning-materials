#include <stdlib.h>
#include <iostream>
#include "sqstack.h"
using namespace std;
//初始化栈
bool InitStack_sq(SqStack &S,int msize)
{
S.elem=new SElemType[msize];
// 给elem指针动态分配msize长度的数组
if(!S.elem){cerr<<"分配内存错误!"<<endl;return false;}
S.stacksize=msize;   //顺序栈的最大容量
S.top=-1;      // 顺序栈初始时空栈
return true;
}
//销毁栈
void DestroyStack_sq(SqStack &S)
{
delete [] S.elem;
S.stacksize=0;
S.top=-1;
}
//清空栈
void ClearStack_sq(SqStack &S)
{
S.top=-1;
}
//判断栈是否为空
bool StackEmpty_sq(SqStack S)
{
return (S.top==-1);
}
//判断栈是否满
bool StackFull_sq(SqStack S)
{
return(S.top==S.stacksize-1);
}
//求栈长度
int StackLength_sq(SqStack S)
{
return S.top+1;
}
//获取栈顶元素
bool GetTop_sq(SqStack S,SElemType &e,SElemType &time)
{
if(S.top==-1)return false;
e=S.elem[S.top];
time=S.time[S.top];
return true;
}
//元素入栈
bool Push_sq(SqStack &S, SElemType e,SElemType time)
{
if(StackFull_sq(S))return false;
++S.top;
S.elem[S.top]=e;
S.time[S.top]=time;
return true;
}
//元素出栈
bool Pop_sq(SqStack &S,SElemType &e,SElemType &time)
{
if(StackEmpty_sq(S))return false;
e=S.elem[S.top--];
time=S.time[S.top--];
return true;
}
//遍历元素
void StackTraverse_sq(SqStack S)
{
int i;
for(i=0;i<=S.top;i++)
cout<<S.elem[i]<<' ';
cout<<endl;
}