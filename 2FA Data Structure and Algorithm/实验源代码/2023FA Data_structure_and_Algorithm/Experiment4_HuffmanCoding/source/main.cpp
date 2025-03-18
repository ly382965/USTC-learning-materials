#include <iostream>
#include "huffman.h"
#define MAX_W 100
using namespace std;

int main()
{
    char tree[20][100]={"\0"};
    HuffTree HT;
    int mode=0;
    int n=0;
    int w[MAX_W]={0};
    char cchar[MAX_W]="\0";
    char **HC=NULL;
    FILE* fpr=NULL;
    FILE* fpw=NULL;
    int k=0;
    int init=1;
    int position=0;
    while (1)
    {
        cout<<"输入数字以完成功能："<<endl;
        cout<<"1.初始化，2.编码，3.解码，4.打印代码文件，5.打印huffman树,6.退出"<<endl;
        cin>>mode;
        switch (mode)
        {
        case 1:
            fpr=fopen("D:\\Codes\\Codes_Cpp\\Experiment4_HuffmanCoding\\source\\frequent.txt","r");
            cout<<"输入字符集大小n:";
            cin>>n;
            /*
            while (!feof(fpr))
            {
                fscanf(fpr,"%c %d\n",&cchar[k],&w[k]);
                k++;
            }
            fclose(fpr);
            cchar[k-1]=' ';
            */
            cout<<"输入:";
            for(k=0;k<n;k++)
            {
                getchar();
                scanf("%c %d",&cchar[k],&w[k]);

            }
            cchar[n-1]=' ';
            getchar();
            getchar();
            Init_HfmTree(HT,w,n);
            fpw=fopen("D:\\Codes\\Codes_Cpp\\Experiment4_HuffmanCoding\\source\\hfmtree.txt","w");
            Write_Hfmtree(HT,fpw,n);
            fclose(fpw);
            break;
        case 2:
            fpr=fopen("D:\\Codes\\Codes_Cpp\\Experiment4_HuffmanCoding\\source\\frequent.txt","r");
            k=0;
            while (!feof(fpr))
            {
                fscanf(fpr,"%c %d\n",&cchar[k],&w[k]);
                k++;
            }
            cchar[k-1]=' ';
            n=k;
            fclose(fpr);
    
            fpr=fopen("D:\\Codes\\Codes_Cpp\\Experiment4_HuffmanCoding\\source\\hfmtree.txt","r");
            Read_Hfmtree(HT,fpr);
            fclose(fpr);

            Hfmtree_Coding(HT,HC,n);
            for(int i=1;i<n+1;i++)
            {
                cout<<cchar[i-1]<<":";
                cout<<HC[i]<<endl;
            }
            fpr=fopen("D:\\Codes\\Codes_Cpp\\Experiment4_HuffmanCoding\\source\\ToBeTran.txt","r");
            fpw=fopen("D:\\Codes\\Codes_Cpp\\Experiment4_HuffmanCoding\\source\\CodeFile.txt","w");
            Encoding_text(HC,fpr,fpw,n);
            fclose(fpr);
            fclose(fpw);
            break;
        case 3:
            fpr=fopen("D:\\Codes\\Codes_Cpp\\Experiment4_HuffmanCoding\\source\\CodeFile.txt","r");
            fpw=fopen("D:\\Codes\\Codes_Cpp\\Experiment4_HuffmanCoding\\source\\TextFile.txt","w");
            Huffman_decoding(HT,fpr,fpw,cchar);
            fclose(fpr);
            fclose(fpw);
            break;
        case 4:
            fpr=fopen("D:\\Codes\\Codes_Cpp\\Experiment4_HuffmanCoding\\source\\CodeFile.txt","r");
            Huffman_print(fpr);
            fclose(fpr);
            break;
        case 5:
            for(int i=0;i<20;i++)
            {
                for(int j=0;j<100;j++)
                {
                    tree[i][j]=' ';
                }
            }
            while(HT[init].parent!=0)
            {
                init++;
            }
            PrintTree(HT,init,tree,0,cchar,position);
            cout<<endl;
            for(int i=0;i<20;i++)
            {
                for(int j=0;j<100;j++)
                {
                    cout<<tree[i][j];
                }
                cout<<endl;
            }
            fpw=fopen("D:\\Codes\\Codes_Cpp\\Experiment4_HuffmanCoding\\source\\TreePrint.txt","w");
            for(int i=0;i<20;i++)
            {
                for(int j=0;j<100;j++)
                {
                    fprintf(fpw,"%c",tree[i][j]);
                }
                fprintf(fpw,"\n");
            }
            fclose(fpw);
            break;
        case 6:
            return 0;
            break;
        
        default:
            break;
        }
    }
    
    return 0;
}