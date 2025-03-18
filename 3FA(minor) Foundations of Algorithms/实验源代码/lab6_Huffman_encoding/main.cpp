#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <string.h>
#define MAX 100
#define QLEN 1000
using namespace std;
typedef struct Huffman_tree_node
{
    char character;
    int freq;
    Huffman_tree_node* lchild;
    Huffman_tree_node* rchild;
    char huffman_code[MAX];
} TNode;

TNode* huffman(TNode *q, int length);
int extract_min(TNode *q,int length);
void encoding(TNode *root , char huffman_code[128][MAX]);
int main()
{
    char huffmancode[128][MAX]={"\0"};
    int freq[128]={0};
    ifstream  fin("./original.txt",ios::in);
    char signal='\0';
    while (!fin.eof())
	{
        fin >> signal;
        freq[(int)signal]++;
        //cout<< signal;
	}
    fin.close();
    TNode *q = new TNode [QLEN];

    int j=0;
    for (int i = 0; i < 128; i++)
    {
        if(freq[i] != 0)
        {
            //cout << (char)i <<":"<< freq[i] << endl;
            q[j].character=(char)i;
            q[j].freq=freq[i];
            q[j].lchild=NULL;
            q[j].rchild=NULL;
            strcpy(q[j].huffman_code,"\0");
            j++;
        }
    }

    TNode *root = huffman(q,j);
    strcpy(root->huffman_code,"\0");
    encoding(root,huffmancode);
    for (int i = 0; i < 128; i++)
    {
        if(strlen(huffmancode[i]) != 0)
        {
            cout << (char)i << ":" << huffmancode[i] << " freq: " <<freq[i]<< endl; 
        }
    }
    
    ifstream  fin2("./original.txt",ios::in);
    ofstream  fout("./out.txt", ios::out);

    int incount = 0;
    int outcount = 0;
    while (!fin2.eof())
	{
        fin2 >> signal;
        fout << huffmancode[(int)signal];
        incount+=7;
        outcount+=strlen(huffmancode[(int)signal]);
	}
    fin2.close();
    fout.close();
    cout<<"压缩率："<<(float)outcount/incount <<endl;
    system("pause");
    return 0;
}

TNode* huffman(TNode *q, int length)
{
    int n = length;
    TNode* root = NULL;
    for (int i = 1; i < n; i++)    
    {
        TNode* z = new TNode;
        TNode* x = new TNode;
        TNode* y = new TNode;
        int xposi = extract_min(q,length);
        x->character = q[xposi].character;
        x->freq = q[xposi].freq;
        x->lchild = q[xposi].lchild;
        x->rchild = q[xposi].rchild;
        strcpy(x->huffman_code,"\0");
        q[xposi].freq = INT_MAX;
        int yposi = extract_min(q,length);
        y->character = q[yposi].character;
        y->freq = q[yposi].freq;
        y->lchild = q[yposi].lchild;
        y->rchild = q[yposi].rchild;
        strcpy(y->huffman_code,"\0");
        q[yposi].freq = INT_MAX;

        z->lchild = x;
        z->rchild = y;
        z->freq = x->freq + y->freq;
        z->character = '\0';
        strcpy(z->huffman_code,"\0");
        q[length] = *z;
        length++;
        root = z;
    }
    return root;
}

int extract_min(TNode *q,int length)
{
    int min=INT_MAX;
    int posi=0;
    for (int i = 0; i < length; i++)
    {
        if(q[i].freq < min)
        {
            min=q[i].freq;
            posi=i;
        }
    }
    return posi;
}

void encoding(TNode *root , char huffmancode[128][MAX])
{
    if(root->rchild)
    {
        char mid[MAX];
        strcpy(mid,root->huffman_code);
        strcpy(root->rchild->huffman_code,strcat(mid, "1"));
        encoding(root->rchild,huffmancode);
    }

    if(root->lchild)
    {
        char mid[MAX];
        strcpy(mid,root->huffman_code);
        strcpy(root->lchild->huffman_code,strcat(mid, "0"));
        encoding(root->lchild,huffmancode);
    }

    if(root->lchild == NULL && root->rchild == NULL)
    {
        strcpy(huffmancode[(int)root->character],root->huffman_code);
    }
}