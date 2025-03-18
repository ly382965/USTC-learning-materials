#include <iostream>
#include <fstream>
#include <queue>
#include <stdlib.h>
#include<algorithm>//find函数在其中
#define MAXVEX 60000
using namespace std;
typedef int VerTexType;
typedef struct ArcNode
{
    int adjvex;//序号
    struct ArcNode* nextarc;
}ArcNode;//边结点

typedef struct VNode
{
    VerTexType data;
    ArcNode *firstarc;
}VNode,AdjList[MAXVEX];//顶点

typedef struct 
{
    AdjList vertices;
    int vexnum,arcnum;
}Graph;
void BFS(Graph G,int s);
int main()
{
    ifstream  fin("./test.txt",ios::in);
    Graph G;
    fin>>G.vexnum>>G.arcnum;
    for (int i = 0; i < G.vexnum; i++)
    {
        G.vertices[i].data = 0;
        G.vertices[i].firstarc=NULL;
    }
    int i,j,k;
    for (k = 0; k < G.arcnum; k++)
    {
        //cout<<k<<endl;
        int v1,v2;
        fin>>v1>>v2;
        i=0;
        int symbol=0;
        while (G.vertices[i].data != 0)
        {
            if(G.vertices[i].data == v1)
            {
                symbol=1;
                break;
            }
            i++;
        }
        if(symbol == 0)
        {
            G.vertices[i].data=v1;
        }

        symbol=0;
        j=0;
        while (G.vertices[j].data != 0)
        {
            if(G.vertices[j].data == v2)
            {
                symbol=1;
                break;
            }
            j++;
        }
        if(symbol == 0)
        {
            G.vertices[j].data=v2;
        }
        
        ArcNode* p1=new ArcNode;
        p1->adjvex=j;
        p1->nextarc=G.vertices[i].firstarc;
        G.vertices[i].firstarc=p1;//头插法
    }
    
    fin.close();
    BFS(G,0);
    system("pause");
    return 0;
}

void BFS(Graph G,int s)
{
    bool visited[MAXVEX]={false};
    cout<<G.vertices[s].data<<endl;
    visited[s]=true;
    queue<int> q;
    q.push(s);
    while (!q.empty())
    {
        int u=q.front();
        q.pop();
        ArcNode* w=G.vertices[u].firstarc;
        while (w!=NULL)
        {
            if(!visited[w->adjvex])
            {
                cout<<G.vertices[w->adjvex].data<<endl;
                q.push(w->adjvex);
                visited[w->adjvex]=true;
            }
            w=w->nextarc;
        }
    }
}

