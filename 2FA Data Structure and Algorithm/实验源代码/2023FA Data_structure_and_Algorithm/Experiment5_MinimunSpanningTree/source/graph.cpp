#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include "graph.h"
using namespace std;
void CreateGraph(ALGraph &G) //创建图G
{
    int i,j,k;
    VexType u,v;
    ArcNode *p;
    double weight;
    cout<<"请输入图的顶点数:";
    cin>>G.VexNum;
    cout<<"请输入图的弧数:";
    cin>>G.ArcNum;

    for(i=0;i<G.VexNum;i++){
        cout<<"请输入第"<<i+1<<"个结点的元素值：";
        cin>>G.vertices[i].data; //顶点赋值
        G.vertices[i].firstarc=NULL;
    }
    cout<<"输入"<<G.ArcNum<<"个弧的两个顶点元素以及权值:"<<endl;
    for(k=0;k<G.ArcNum;k++){       
        cin>>u>>v>>weight;
        i=LocateVex(G,u);
        j=LocateVex(G,v);
        p=new ArcNode;
        p->adjvex=j;
        p->weight=weight;
        p->nextarc=G.vertices[i].firstarc;
        G.vertices[i].firstarc=p;
        p=new ArcNode;
        p->adjvex=i;
        p->weight=weight;
        p->nextarc=G.vertices[j].firstarc;
        G.vertices[j].firstarc=p;
    }//for
}
int LocateVex(ALGraph G, VexType u) //返回u在G中的位置
{
    int i;
    for(i=0;i<G.VexNum;i++)
    if(G.vertices[i].data==u)return i;
    return -1;
}
bool visited[MAX_VEX_NUM];
void DFS(ALGraph G,int v)
{
    int w;
    cout<<G.vertices[v].data; //visit 内容
    visited[v]=true;
    for(w=FirstAdjVex(G,v);w!=-1;w=NextAdjVex(G,v,w))
    if(!visited[w])DFS(G,w);
}
void DFSTraverse(ALGraph G) //深度优先遍历
{
    int i,v;
    for(i=0;i<G.VexNum;i++)visited[i]=false;
    for(v=0;v<G.VexNum;v++)
    if(!visited[v])DFS(G,v);
    cout<<endl;
}

VexType GetVex(ALGraph G,int v) //返回G中v顶点的值
{
    return G.vertices[v].data;
}
void PutVex(ALGraph &G,int v,VexType value) //为G中v结点赋值为value
{
    G.vertices[v].data=value;
}
int FirstAdjVex(ALGraph G,int v) //返回G中v的第一个邻接点
{
    if(G.vertices[v].firstarc)
    return G.vertices[v].firstarc->adjvex;
    else
    return -1;
}
int NextAdjVex(ALGraph G,int v,int w) //返回G中相对于w的v的下一个邻接点
{
    ArcNode *p;
    p=G.vertices[v].firstarc;
    while(p&&p->adjvex!=w)p=p->nextarc;
    if(!p||!p->nextarc)
    return -1;
    else
    return p->nextarc->adjvex;
}


void Prim(ALGraph G,int v0,int adjvex[])//序号为v0出发
{
    double lowcost[MAX_VEX_NUM];
    int k=0;
    for (int i = 0; i < G.VexNum; i++)
    {
        lowcost[i]=INFINITY;
        adjvex[i]=v0;
    }
    ArcNode *p=G.vertices[v0].firstarc;
    while (p!=NULL)
    {
        if(p->adjvex!=v0)
        {
            lowcost[p->adjvex]=p->weight;
            p=p->nextarc;
        }
    }
    lowcost[v0]=0;//标记为红点

    for(int i=0;i<G.VexNum-1;i++)
    {
        k=MinEdge(lowcost,G.VexNum);
        printf("(%c,%c),%lf)\n",G.vertices[k].data,G.vertices[adjvex[k]].data,lowcost[k]);
        lowcost[k]=0;
        p=G.vertices[k].firstarc;
        while (p!=NULL)
        {
            if(p->weight<lowcost[p->adjvex])
            {
                adjvex[p->adjvex]=k;
                lowcost[p->adjvex]=p->weight;
            }
            p=p->nextarc;
        }
    }
    
}
int MinEdge(double lowcost[],int length)//找lowcost中最小值
{
    int min=0;
    double minnum=10000.0;
    for(int i=0;i<length;i++)
    {
        if(lowcost[i]<minnum && lowcost[i]!=0)
        {
            minnum=lowcost[i];
            min=i;
        }
    }
    return min;
}