#include <iostream>
#include <fstream>
#include <queue>
#include <stdlib.h>
#define MAXVEX 100
using namespace std;
typedef char VerTexType;
typedef int ArcType;
typedef struct 
{
    VerTexType vexs[MAXVEX];
    ArcType arcs[MAXVEX][MAXVEX];
    int vexnum,arcnum;
}Graph;
void BFS(Graph G,int s);
int main()
{
    ifstream  fin("./data.txt",ios::in);
    Graph G;
    fin>>G.vexnum>>G.arcnum;
    int i=0,j=0,k=0;
    VerTexType v1,v2;
    for (i = 0; i < G.vexnum; i++)
    {
        fin>>G.vexs[i];
    }
    for (i = 0; i < G.arcnum; i++)
    {
        for (j = 0; j < G.arcnum; j++)
        {
            G.arcs[i][j]=INT_MAX;
        }
    }
    for (k = 0; k < G.arcnum; k++)
    {
        char mid;
        fin>>v1>>mid>>v2;
        i=(int)(v1-'A');
        j=(int)(v2-'A');
        G.arcs[i][j]=1;
        G.arcs[j][i]=G.arcs[i][j];
    }
    BFS(G,0);
    fin.close();
    system("pause");
    return 0;
}

void BFS(Graph G,int s)
{
    bool visited[MAXVEX]={false};
    cout<<(char)(s+'A')<<endl;
    visited[s]=true;
    queue<int> q;
    q.push(s);
    while (!q.empty())
    {
        int u=q.front();
        q.pop();
        for(int i=0;i<G.vexnum;i++)
        {
            if(G.arcs[i][u] == 1 && !visited[i])
            {
                cout<<(char)(i+'A')<<endl;
                visited[i]=true;
                q.push(i);
            }
        }
    }
}