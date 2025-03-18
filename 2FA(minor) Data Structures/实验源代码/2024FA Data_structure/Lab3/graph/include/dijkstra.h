#include "graph.h"

class dijkstra{
    public:
        void ssp(int s);           //求解最短路径
        void print(int u);         //输出路径的辅助函数
    public:
        dijkstra() = default;
        dijkstra(graph _g)
        {
            g = _g;
        }
        ~dijkstra() = default;
    private:
        graph g;
        struct Vertex{
            int sure;               //最短路径是否确定，对应书中S数组
            int path;               //记录最短路径上的前驱，对应书中Path数组
            int dist;               //记录最短路径的长度，对应书中D数组
        };
        struct Vertex vertex[N];
};