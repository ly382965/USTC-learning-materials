#include <iostream>
#include <stdio.h>
#include <stdlib.h>
using namespace std;
#include "sqstack.h"
#include "linkqueue.h"
typedef LinkList Queneptr;
typedef struct{
Queueptr rear;
int length;
}Queue_cir;
void Initqueue(Queue_cir &Q);
void Enqueue(Queue_cir &Q,QElemType e);
bool Dequeue(Queue_cir &Q,QElemType &e);

int main()
{
    Queue_cir Q;
    QElemType e;
    int i;
    cout<<"1)初始化队列Q"<<endl;
    Initqueue(Q);
    cout<<"2)依次入队列元素a、 b、 c、 d、 e."<<endl;
    for (i=0;i<5;i++)
    Enqueue(Q,'a'+i);
    for(i=0;i<5;i++){
    cout<<"8)出队列一个元素.";
    cout<<(Dequeue(Q,e)?"出队列成功!":"出队列失败!")<<e<<endl;
    }
    getchar();
    return 0;
}

void Initqueue(Queue_cir &Q)
{
    Q.rear=NULL;
    Q.length=0;
}
void Enqueue(Queue_cir &Q,QElemType e)
{
    if(Q.length+1>=QUEUE_INIT_SIZE)
    {
        cout<<"队列已满";
        return;
    }
    Q.length++;
    Queneptr p=new LNode;
    if(!Q.rear)
    {
        p->data=e;
        p->next=p;
        Q.rear=p;
    }
    else
    {
        p->data=e;
        p->next=Q.rear->next;
        Q.rear->next=p;
        Q.rear=p;
    }
    
}
bool Dequeue(Queue_cir &Q,QElemType &e)//e为头元素的值
{
    if(Q.rear==NULL)
    {
        return false;
    }
    Queneptr p=Q.rear->next;
    e=p->data;
    Q.rear->next=p->next;
    delete p;
    Q.length--;
    return true;
}


























/*
int calculate(char suffix[])
{
    //对逆波兰式suffix求值，表达式以'#'结束
    char *p=suffix;
    SqStack S;
    InitStack_sq(S);
    char ch=*p++;
    SElemType a,b,e;
    while (ch!='#')
    {
        if(!isoperator(ch))//isoperator(ch)判断ch是否为操作符
        Push_sq(S,ch);
        else{
            Pop_sq(S,b);Pop_sq(S,a);
            Push_sq(S,operate(a,ch,b));//a,b运算
        }
        ch=*p++;
    }
    Pop_sq(S,e);
    DestroyStack_sq(S);
    return e;//结果
    
}
SElemType operate(SElemType a,char ch,SElemType b)
{
    switch (ch)
    {
    case '+':
        return a+b;
    case '-':
        return a-b;
    case '*':
        return a*b;
    case '/':
        return a/b;
    default:
        cout<<"error!";
        return -1;
        break;
    }
}
*/