#include <iostream>
#include <string.h>
#include "linklist.h"
//初始化链表
using namespace std;
//求链表长度
int ListLength_L(LinkList L)
{
LNode * p=L->next;
int k=0;
while(p!=L){p=p->next;k++;}
return k;
}
void createJosephList(LinkList &L)
{
    int n=0;
    cout<<"输入n："<<endl;
    cin>>n;
    LNode *head,*s,*head2;
    head=new LNode;
    head->next=NULL;
    head->data=-1;//-1标记
    head->sequence=0;
    head2=head;
    for(int i=0;i<n;i++)
    {
        s=new LNode;
        s->next=NULL;
        head->next=s;
        head=s;
        cout<<"输入第"<<i+1<<"个人的密码：";
        cin>>s->data;
        s->sequence=i+1;
    }
    head->next=head2;
    L=head;
}
void printJosephList(LinkList &L,int m)
{
    int n=ListLength_L(L);
    int step=1;
    while (n>0)
    {   
        step=m%n;
        m=pop_L(L,step);
        n--;
    }
}
ElemType pop_L(LinkList &L,int times)
{
    int data=0;
    for(int i=1;i < times;i++)
    {
        if(L->next->data==-1)
        {
            L=L->next->next;
        }
        else
        {
            L=L->next;
        }
    }
    LNode *p=NULL;
    if(L->next->data!=-1)
    {
        data=L->next->data;
        cout<<L->next->sequence<<',';
        p=L->next;
        L->next=p->next;
    }
    else
    {
        data=L->next->next->data;
        cout<<L->next->next->sequence<<',';
        p=L->next->next;
        L->next->next=p->next;
    }
    delete p;
    return data;
}

/*
void InitList_L(LinkList &L)
{
L=NULL;
}
//销毁链表
void DestroyList_L(LinkList &L)
{
    LNode *p;
while(L){
p=L;
L=L->next;
delete p;
}
}
//判断链表是否为空
bool ListEmpty_L(LinkList L)
{
return (L==NULL);
}

//查找元素
int LocateItem_L(LinkList L,ElemType e)
{
int j=1;
LNode * p=L;
while(p&&p->data!=e){p=p->next;j++;}
if(p)return j;
else return 0;
}
//获取元素
bool GetItem_L(LinkList L,int i,ElemType &e)
{
int j=1;
LNode * p=L;
if(i<1){printf("i值非法!");return false;}
while(j<i&&p){
j++;
p=p->next;
}
if(p)
{e=p->data;return true;}
else
return false;
}
//插入元素
bool ListInsert_L(LinkList &L,int i,ElemType e)
{
    int  j=1;
    LNode *p=L,*s;
    if(i<1){printf("i值非法!");return false;}
    while(j<i-1&&p){p=p->next;j++;}   //p指向i-1结点
    if(!p&&i!=1){
        cout<<"未找到i-1结点!"<<endl;
        return false;
    }
    s=new LNode;
    s->data=e;
    if(i==1){
        s->next=L;
        L=s;
    }
    else{
        s->next=p->next;
        p->next=s;
    }
    return true;
}
//删除元素
bool ListDelete_L(LinkList &L,int i)
{
int j=1;
LNode *p=L->next,*q;
if(i<1) {printf("i值非法!");return false;}
while(j<i-1&&p){p=p->next;j++;} //p指向i-1结点
if(!p||!(p->next)){
cout<<"未找到i-1/i结点!"<<endl;
return false;
}
if(i==1){ //删除第一个结点
q=L;
L=L->next;
}
else{
q=p->next;
p->next=q->next;
}
delete q;
return true;
}
//遍历链表
void ListTraverse_L(LinkList L)
{
LNode *p=L->next;
while(p!=L){
p=p->next;
cout<<p->data<<' ';

}
cout<<endl;
}

ElemType ListPop_L(LinkList L,int i)
{
    int j=1;
    ElemType e;
    LNode *p=L->next,*q;
    if(i<1) {printf("i值非法!");return false;}
    while(j<i-1&&p){p=p->next;j++;} //p指向i-1结点
    if(!p||!(p->next)){
    cout<<"未找到i-1/i结点!"<<endl;
    return false;
    }
    if(i==1){ //删除第一个结点
    q=L;
    L=L->next;
    e=q->data;
    }
    else{
    q=p->next;
    p->next=q->next;
    e=q->data;
    }
    delete q;
    return e;
}
*/