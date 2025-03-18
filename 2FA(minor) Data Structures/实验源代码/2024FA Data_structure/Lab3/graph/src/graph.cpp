#include "../include/graph.h"
#include<iostream>

void graph::init(int u[],int v[],int w[])
{
    //TODO:完成邻接表存储图
    for (int i = 0; i < edge_num; i++)
    {
        Edge* p1=new Edge;
        p1->adj=v[i];
        p1->weight=w[i];
        p1->next=vertex[u[i]].head;
        vertex[u[i]].head=p1;
        Edge* p2=new Edge;
        p2->adj=u[i];
        p2->weight=w[i];
        p2->next=vertex[v[i]].head;
        vertex[v[i]].head=p2;
    }
}
void graph::dfs(int s)
{
    //TODO:完成图的深度优先遍历，输出顶点编号
    std::cout<<s<<std::endl;
    vertex[s].visited = 1; 
    for(Edge* u=vertex[s].head;u!=NULL;u=u->next)
    {
        if(vertex[u->adj].visited==0)
        {
            dfs(u->adj);
        }
    }
}