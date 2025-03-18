#define MAX_VEX_NUM 20
#define INFINITY 32767
typedef char VexType;
typedef enum{DG,DN,AG,AN} GraphKind;
typedef struct ArcNode{
    int adjvex;
    double weight;
    struct ArcNode *nextarc;
}ArcNode,*ArcLink;

typedef struct VexNode{
    VexType data;
    struct ArcNode *firstarc;
}VexNode,AdjList[MAX_VEX_NUM];

typedef struct {
    AdjList vertices;
    int VexNum,ArcNum;
    int kind;
}ALGraph;

void CreateGraph(ALGraph &G); //创建图G
int MinEdge(double lowcost[],int length);//找lowcost中最小值
void Prim(ALGraph G,int v0,int adjvex[]);
int LocateVex(ALGraph G, VexType u);
void DFSTraverse(ALGraph G); //深度优先遍历
void DFS(ALGraph G,int v);
VexType GetVex(ALGraph G,int v); //返回G中v顶点的值
void PutVex(ALGraph &G,int v,VexType value); //为G中v赋值为value
int FirstAdjVex(ALGraph G,int v); //返回G中v的第一个邻接点
int NextAdjVex(ALGraph G,int v,int w);//返回G中相对于w的v的下一个邻接点