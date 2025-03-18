#include "../include/dijkstra.h"
#include <iostream>
void dijkstra::ssp(int s)
{
    //初始化
    int n= g.vertex_num;
    for(int i=0;i<n;i++)
    {
        vertex[i].sure = 0;
        vertex[i].dist = INT_MAX;
        vertex[i].path = -1;
    }
    for(graph::Edge* u = g.vertex[s].head;u!=NULL;u=u->next)
    {
        vertex[u->adj].dist = u->weight;
        vertex[u->adj].path = s;
    }
    vertex[s].sure = 1;
    vertex[s].dist = 0;
    //对剩余顶点进行计算
    for (int i = 0; i < n; i++)
    {
        if(i==s)
        {
            continue;
        }
        else
        {
            int min=INT_MAX;
            int v;
            for (int w = 0; w < n; w++)
            {
                if(!vertex[w].sure && vertex[w].dist < min)
                {
                    v=w;
                    min=vertex[w].dist;
                }
            }
            vertex[v].sure = 1;
            for(graph::Edge* u = g.vertex[v].head;u!=NULL;u=u->next)
            {
                if(!vertex[u->adj].sure && (vertex[v].dist + u->weight < vertex[u->adj].dist))
                {
                    vertex[u->adj].dist=vertex[v].dist + u->weight;
                    vertex[u->adj].path = v;
                }
            }
            
            
        }
    }
    

    //TODO:实现以s为起始点的dijkstra算法求最短路径
}
void dijkstra::print(int u)
{
    if(vertex[u].path != -1)
    {
        print(vertex[u].path);
    } 
    std::cout << u << "->";
    //TODO:用于输出最短路径的辅助函数，可以使用递归实现
}