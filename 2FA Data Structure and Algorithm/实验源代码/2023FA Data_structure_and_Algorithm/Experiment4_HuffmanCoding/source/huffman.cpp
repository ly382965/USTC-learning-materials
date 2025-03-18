#include <iostream>
#include <string.h>
#include <stdint.h>
#include "huffman.h"
void Init_HfmTree(HuffTree &HT,WeightType *w,int n)//输入n构造huffman树
{
    int m=n*2-1;//结点总数m
    HT= new HTNode[m+1];
    int s1=0,s2=0;
    int i=0;
    for(i=1;i<=m;i++)//初始化数组HT
    {
        HT[i].weight=(i<=n)?w[i-1]:0;
        HT[i].lchild=0;
        HT[i].rchild=0;
        HT[i].parent=0;
    }
    for(i=n+1;i<=m;i++)
    {
        Select(HT,i,s1,s2);
        HT[i].lchild=s1;
        HT[i].rchild=s2;
        HT[i].weight=HT[s1].weight+HT[s2].weight;
        HT[s1].parent=i;HT[s2].parent=i;
    }
}
void Select(HuffTree HT,int i,int &s1,int &s2)//选择权重最小的两个值
{
    int min_1=INT32_MAX-1,min_2=INT32_MAX;
    for(int j=0;j<i;j++)
    {
        if(HT[j].parent==0)
        {
            if(HT[j].weight<=min_1)
            {
                min_2=min_1;
                min_1=HT[j].weight;
                s2=s1;
                s1=j;
            }
            else if(HT[j].weight<=min_2)
            {
                min_2=HT[j].weight;
                s2=j;
            }
        }
    }
}
void Hfmtree_Coding(HuffTree HT,char **&HC,int n)//HT->编码给HC指针数组
{
    SqStack S;
    InitStack_sq(S);
    HC=new char *[n+1];
    Coding(HT,2*n-1,HC,S);
}
void Coding(HuffTree HT,int root,char **HC,SqStack &S)
{
    char ch='\0';
    if(root!=0)
    {
        if(HT[root].lchild==0)
        {
            Push_sq(S,'\0');
            HC[root]=new char[StackLength_sq(S)-1];
            strcpy(HC[root],S.elem);
            Pop_sq(S,ch);
        }
        Push_sq(S,'0');
        Coding(HT,HT[root].lchild,HC,S);//遍历左子树
        Pop_sq(S,ch);
        Push_sq(S,'1');
        Coding(HT,HT[root].rchild,HC,S);
        Pop_sq(S,ch);
    }
}
void Write_Hfmtree(HuffTree HT,FILE* hfmtree,int n)//写入Huffman树
{
    int m=n*2-1;//结点总数m
    for (int i = 1; i<=m; i++)
    {
        fprintf(hfmtree,"%d %d %d %d\n",HT[i].weight,HT[i].parent,HT[i].lchild,HT[i].rchild);
    }
}
void Read_Hfmtree(HuffTree &HT,FILE* hfmtree)//读取huffman树
{
    HT= new HTNode[HT_SIZE];
    int i=1;
    while (!feof(hfmtree))
    {
        fscanf(hfmtree,"%d %d %d %d\n",&HT[i].weight,&HT[i].parent,&HT[i].lchild,&HT[i].rchild);
        i++;
    }
}
void Encoding_text(char **HC,FILE* fpr,FILE* fpw,int n)//编码模块
{
    char txt[MAX_STR_LEN+1]="\0";
    while(!feof(fpr))
    {
        fgets(txt,MAX_STR_LEN +1,fpr);
        Huffman_encoding(HC,txt,fpw,n);
    }
}
void Huffman_encoding(char **HC,char* txt,FILE *fpw,int n)//写入
{
    while (*txt!='\0')
    {
       if(*txt==' ')
       {
            fprintf(fpw,"%s",HC[n]);
       }
       else
       {
            fprintf(fpw,"%s",HC[*txt-'A'+1]);
       }
        txt++;
    }

}
void Huffman_decoding(HuffTree HT,FILE * fpr ,FILE* fpw,char* cchar)//解码
{
    char code[MAX_CODE_LEN]="\0";
    fgets(code,MAX_CODE_LEN,fpr);
    int i=0;
    int init=1;
    int node=0;
    while(HT[init].parent!=0)
    {
        init++;
    }
    node=init;
    while(code[i]!='\0')
    {
        if(code[i]=='0')
        {
            if(HT[node].lchild!=0)
            {
                node=HT[node].lchild;
            }
            else
            {
                fprintf(fpw,"%c",cchar[node-1]);
                node=init;
                i--;
            }
        }
        else if(code[i]=='1')
        {
            if(HT[node].rchild!=0)
            {
                node=HT[node].rchild;
            }
            else
            {
                fprintf(fpw,"%c",cchar[node-1]);
                node=init;
                i--;
            }
        }
        i++;
    }
    fprintf(fpw,"%c",cchar[node-1]);
    
}
void Huffman_print(FILE *fp)
{
    char code[MAX_CODE_LEN]="\0";
    fgets(code,MAX_CODE_LEN,fp);
    int i=0;
    while(code[i]!='\0')
    {
        printf("%c",code[i]);
        if((i+1)%50==0&&i!=0)
        {
            printf("\n");
        }
        i++;
    }
    printf("\n");
}

void PrintTree(HuffTree HT,int i,char (*tree)[100],int layer,char *cchar,int &position) //按树状打印二叉树 
{ 

    if(HT[i].lchild==0)
    {
        if(cchar[i-1]!=' '){
        tree[layer][position]=cchar[i-1];
        }
        else
        {
            tree[layer][position]='^';
        }
        position++;
    }
    else
    {
        PrintTree(HT,HT[i].lchild,tree,layer+1,cchar,position);
        tree[layer][position]='*';
        position++;
        PrintTree(HT,HT[i].rchild,tree,layer+1,cchar,position);
    }

}

 