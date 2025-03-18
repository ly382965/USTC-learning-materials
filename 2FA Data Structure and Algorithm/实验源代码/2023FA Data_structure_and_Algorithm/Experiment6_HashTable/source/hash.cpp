#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <string.h>
#include <math.h>
#include "hash.h"
using namespace std;
int HashFunc(LinkHashList HT,ElemType e)
{
    return (e[0]*100+e[strlen(e)-1])%41;
}
void InitHashList(LinkHashList &HT,int m) //创建哈希表
{
    HT.head=new LNode *[m];
    HT.length=m;
    for(int i=0;i<m;i++)
    {
        HT.head[i]=NULL;
    }
}
void DestroyHashList(LinkHashList &HT) //销毁哈希表
{
    LNode *p;
    for(int i=0;i<HT.length;i++){
        p=HT.head[i];
        while(!p)
        {
            HT.head[i]=p->next;
            delete p;
            p=HT.head[i];
        }
    } //for
    delete [] HT.head;
    HT.head=NULL;
}
void InsertHT(LinkHashList &HT,ElemType e,int i) //插入元素
{
    int d=HashFunc(HT,e);
    LNode *p=new LNode;
    p->data=e;
    p->num=i;
    p->next=HT.head[d];
    HT.head[d]=p;
}
void DeleteHT(LinkHashList &HT,ElemType &e) //删除元素
{
    int d=HashFunc(HT,e);
    LNode *p=HT.head[d];
    if(!p)return;
    if(strcmp(p->data,e))
    { //第一个结点即是e
        HT.head[d]=p->next;
        delete p;
        return;
    }
    LNode *q=p->next;
    while(!q&&q->data!=e)
    {
        p=q;
        q=q->next;
    }

    if(q)
    {
        p->next=q->next;
        delete q;
    }
}
LNode * SearchHT(LinkHashList HT,ElemType e) //查找元素
{
    int d=HashFunc(HT,e);
    LNode *p=HT.head[d];
    while(p&&strcmp(p->data,e))p=p->next;
    return p;
}
void TraverseHT(LinkHashList HT) //遍历哈希表
{
    LNode *p;
    for(int i=0;i<HT.length;i++)
    {
        p=HT.head[i];
        cout<<"["<<i<<"]";
        while(p){
        cout<<p->data<<"("<<p->num<<")"<<"->";
        p=p->next;
    }
    cout<<endl;
    }//for
}
void Init(LinkHashList &HT,char** keywords)
{
    InitHashList(HT,43);//初始化
    for(int i=0;i<KEYWORDS_LENGTH;i++)
    {
        InsertHT(HT,keywords[i],i);//循环插入
    }
}
void search(LinkHashList HT,FILE *fp,int *num)
{
    char a[100]="\0";//记录一个单词
    int i=0;
    LNode *pNode=NULL;
    while(!feof(fp))
    {
        while (1)
        {
            a[i]=getc(fp);//一个字符一个字符的读取文件
            if(!((a[i]>='a'&&a[i]<='z')||(a[i]>='A'&&a[i]<='Z')||(a[i]=='_')))//遇到非字母和下划线的符号即停止读取，输出单词
            {
                a[i]='\0';
                if(a[0]!='\0')
                {
                    //printf("%s\n",a);
                    pNode=SearchHT(HT,a);//查找所得单词是否在哈希表中
                    if(pNode!=NULL)
                    {
                        num[pNode->num]++;//若在哈希表中，则该字符所对应的，在计数数组中的元素加1
                    }
                }  
                i=0;              
                strcpy(a,"\0");
                break;
            }
            i++;
        }
    }
}

double calculate(int *xi,int *xj)
{
    int sum1=0,sum2=0,sum3=0;
    double sum=0;
    for(int i=0;i<KEYWORDS_LENGTH;i++)
    {
        sum1+=xi[i]*xj[i];
        sum2+=xi[i]*xi[i];
        sum3+=xj[i]*xj[i];
    }
    sum=(double)sum1/(sqrt(sum2)*sqrt(sum3));
    return sum;
}

double distance(int *xi,int *xj)
{
    int sum1=0;
    double sum=0;
    for(int i=0;i<KEYWORDS_LENGTH;i++)
    {
        sum1+=(xi[i]-xj[i])*(xi[i]-xj[i]);
    }
    sum=sqrt((double)sum1);
    return sum;
}