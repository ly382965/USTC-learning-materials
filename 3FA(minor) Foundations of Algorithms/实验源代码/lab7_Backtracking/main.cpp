#include <iostream>
#include <fstream>
#include <stdlib.h>
using namespace std;
#define N 20
int min_finish_time = INT_MAX;
int best_machine_time[N]={0};   
int best_machine_task[N][N]={0};
int best_machine_task_count[N]={0};
int max_machine_time(int* machine_time,int num_machine);
void findmin(int layer,int* task_time,int* machine_time,int** machine_task,int num_task,int num_machine,int* machine_task_count);
void quicksort_fixed(int* A,int p,int r);
int partition_fixed(int* A,int p,int r);
int main()
{
    int num_task,num_machine;
    ifstream  fin("./test3.txt",ios::in);
    fin >> num_task >> num_machine;
    int* task_time = new int[num_task](0);
    int* machine_time = new int[num_machine](0);
    int** machine_task = new int*[num_machine];
    int* machine_task_count = new int[num_machine](0);
    for (int i = 0; i < num_machine; i++)
    {
        machine_task[i]=new int[num_task](0);
    }
    
    int i=0;
    while (!fin.eof())
	{
        fin >> task_time[i];
        i++;
	}
    fin.close();

    //pre
    for (int i = 0; i < num_machine; i++)
    {
        machine_time[i]=task_time[i];
        machine_task[i][0]=i;
        machine_task_count[i]++;
    }
    
    findmin(num_machine,task_time,machine_time,machine_task,num_task,num_machine,machine_task_count);

    cout<<"min_time:"<<min_finish_time<<endl;
    cout<<"best_machine_task:"<<endl;

    for (int i = 0; i < num_machine; i++)
    {
        for (int j = 0; j < best_machine_task_count[i]; j++)
        {
            cout<<best_machine_task[i][j]<<",";
        }
        cout<<"time:"<<best_machine_time[i]<<endl;
    }
    
    system("pause");
    return 0;
}

void findmin(int layer,int* task_time,int* machine_time,int** machine_task,int num_task,int num_machine,int* machine_task_count)
{
    // 
    int current_max_time = max_machine_time(machine_time,num_machine);
    if (current_max_time >= min_finish_time) 
    {
        return;
    }

    if(layer==num_task)//到达最后一层
    {
        int min=max_machine_time(machine_time,num_machine);
        if(min<min_finish_time)
        {
            min_finish_time=min;
            for (int i = 0; i < num_machine; i++)
            {
                best_machine_time[i]=machine_time[i];
                for (int j = 0; j < machine_task_count[i]; j++)
                {
                    best_machine_task[i][j]=machine_task[i][j];
                }
            }
            for (int i = 0; i < num_machine; i++)
            {
                best_machine_task_count[i]=machine_task_count[i];
            }
            
        }
    }
    if(layer<num_task)
    {
        for (int i = 0; i < num_machine; i++)
        {
            machine_time[i]+=task_time[layer];
            machine_task[i][machine_task_count[i]++]=layer;
            findmin(layer+1,task_time,machine_time,machine_task,num_task,num_machine,machine_task_count);
            machine_time[i]-=task_time[layer];//回溯
            machine_task_count[i]--;
        }
    }
}

int max_machine_time(int* machine_time,int num_machine)
{
    int max=0;
    for (int i = 0; i < num_machine; i++)
    {
        if(machine_time[i]>max)
        {
            max=machine_time[i];
        }
    }
    return max;
}
