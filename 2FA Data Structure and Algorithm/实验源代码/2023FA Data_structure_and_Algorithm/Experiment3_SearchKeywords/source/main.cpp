#include "sstring.h"
#include "iostream"
#include "stdio.h"
using namespace std;
int main()
{
    int next[MAX_STR_LEN +1]={0};
    SString keyword;
    SString txt;
    cout<<"输入关键词：";
    cin>>keyword;
    int row=1;
    int condition=0;
    FILE* fp=fopen("D:\\Codes\\Codes_Cpp\\Experiment3_SearchKeywords\\source\\The Three Musketeers.txt","r");
    if(fp==NULL)
    {
        cout<<"文件打开失败!";
    }
    while(!feof(fp))
    {
        fgets(txt,MAX_STR_LEN +1,fp);
        get_next(txt,next);
        if(index(txt,keyword,0,next)==true)
        {
            cout<<"行"<<row<<":"<<txt<<endl;
            condition++;
        }
        row++;
    }
    fclose(fp);
    cout<<"共查到"<<condition<<"个结果"<<endl;
    getchar();
    getchar();
}

