#include <cstdio>
#define N 15
#define M 105

class graph{
    public:
        int vertex_num,edge_num;              //记录图的顶点数和边数
        struct Edge{
            int adj;                          //邻接点
            int weight;                       //权值
            struct Edge *next;
        };                                    //记录边
        struct Vertex{
            struct Edge *head;
            int visited;                      //是否被访问，可以用于深度优先遍历
        };                                    //记录顶点
        struct Vertex vertex[N];
    public:
        graph() = default;
        graph(int _vertex,int _edge)
        {
            vertex_num = _vertex;
            edge_num = _edge;
            for(int i=0;i<vertex_num;i++)
            {
                vertex[i].visited = 0;
                vertex[i].head = NULL;
            }
        }
        ~graph() = default;
        void dfs(int s);                       //深度优先遍历
        void init(int u[],int v[],int w[]);    //初始化
    private:
};