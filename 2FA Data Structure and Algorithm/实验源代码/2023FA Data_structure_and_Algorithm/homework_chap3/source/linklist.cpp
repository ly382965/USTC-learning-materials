#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <string.h>
#include "linklist.h"
using namespace std;
//初始化链表
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
//求链表长度
int ListLength_L(LinkList L)
{
LNode * p=L;
int k=0;
while(p){p=p->next;k++;}
return k;
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
int j=1;
LNode *p=L,*s;
if(i<1){printf("i值非法!");return false;}
while(j<i-1&&p){p=p->next;j++;} //p指向i-1结点
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
bool ListDelete_L(LinkList &L,int i,ElemType &e)
{
int j=1;
LNode *p=L,*q;
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
return true;
}
//遍历链表
void ListTraverse_L(LinkList L)
{
LNode *p=L;
while(p){
cout<<p->data<<' ';
p=p->next;
}
cout<<endl;
}