#include "graph.h"
#include <iostream>
using namespace std;
int main()
{
    ALGraph G;
    CreateGraph(G);
    int v0=0;
    int adjvex[MAX_VEX_NUM];
    //DFSTraverse(G);
    
    Prim(G,v0,adjvex);

    getchar();
    getchar();
    return 0;
}