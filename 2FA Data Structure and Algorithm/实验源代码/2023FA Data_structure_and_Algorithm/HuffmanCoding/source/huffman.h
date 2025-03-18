#include "sqstack.h"
#define MAX_STR_LEN 4000
#define MAX_CODE_LEN 32767
#define HT_SIZE 60
typedef int WeightType;
typedef struct 
{
    WeightType weight;
    int parent,lchild,rchild;
}HTNode;
typedef HTNode *HuffTree;

void Init_HfmTree(HuffTree &HT,WeightType *w,int n);//输入n构造huffman树
void Select(HuffTree HT,int i,int &s1,int &s2);
void Hfmtree_Coding(HuffTree HT,char **&HC,int n);//HT->编码给HC指针数组
void Coding(HuffTree HT,int root,char **HC,SqStack &S);
void Write_Hfmtree(HuffTree HT,FILE* hfmtree,int n);//写入Huffman树
void Read_Hfmtree(HuffTree &HT,FILE* hfmtree);//读取huffman树
void Encoding_text(char **HC,FILE* fpr,FILE* fpw,int n);//encoding模块
void Huffman_encoding(char **HC,char* txt,FILE *fpw,int n);//写入
void Huffman_decoding(HuffTree HT,FILE * fpr ,FILE* fpw,char* cchar);//解码
void Huffman_print(FILE *fp);