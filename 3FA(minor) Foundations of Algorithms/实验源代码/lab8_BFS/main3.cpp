#include <iostream>
#include <fstream>
#include <queue>
#include <vector>
#include <unordered_map>
#include <ctime>
using namespace std;
typedef int VerTexType;
typedef struct {
    vector<vector<int>> adjvex;
    vector<VerTexType> vexdata;
    int vexnum, arcnum;
}Graph;
//使用<vector>代替邻接链表
void BFS(Graph G, int s);
int main() 
{
    ifstream fin("./twitter_small.txt", ios::in);
    Graph G;
    fin >> G.vexnum >> G.arcnum;
    G.adjvex.resize(G.vexnum);
    G.vexdata.resize(G.vexnum);
    unordered_map<int, int> vexmap;//hashtable,快速匹配vexdata和序号
    int num=0;
    int i,j,k;

    for (k = 0; k < G.arcnum; k++) 
    {
        int v1,v2;
        fin>>v1>>v2;
        if (vexmap.find(v1) == vexmap.end())
        { 
            vexmap[v1] = num;
            num++;
        }
        if (vexmap.find(v2) == vexmap.end()) 
        {
            vexmap[v2] = num;
            num++;
        }
        i=vexmap[v1];
        j=vexmap[v2];
        G.vexdata[i]=v1;
        G.vexdata[j]=v2;
        G.adjvex[i].push_back(j);
    }
    fin.close();
    // Start measuring time
    struct timespec begin, end; 
    clock_gettime(CLOCK_REALTIME, &begin);
    BFS(G, 0);
    // Stop measuring time and calculate the time
    clock_gettime(CLOCK_REALTIME, &end);
    long seconds = end.tv_sec - begin.tv_sec;
    long nanoseconds = end.tv_nsec - begin.tv_nsec;
    double times = seconds + nanoseconds*1e-9;

    cout<<"Time measured(fixed) "<< times <<" seconds"<<endl;
    system("pause");
    return 0;
}

void BFS(Graph G, int s) 
{
    vector<bool> visited(G.vexnum, false);
    queue<int> q;
    visited[s] = true;
    q.push(s);
    ofstream fout("./out.txt", ios::out);
    fout << G.vexdata[s] << endl;

    while (!q.empty()) {
        int u = q.front(); 
        q.pop();
        auto w=G.adjvex[u].begin();
        while (w!=G.adjvex[u].end()) 
        {
            if (!visited[*w]) 
            {
                visited[*w] = true;
                q.push(*w);
                fout << G.vexdata[*w] << endl;
            }
            w++;
        }
    }
    fout.close();
}