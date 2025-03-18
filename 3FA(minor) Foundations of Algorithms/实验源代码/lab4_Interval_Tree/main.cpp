#include <iostream>
#include <fstream>
#include <stdlib.h>
using namespace std;
enum COLOR{
    RED,
    BLACK
};

struct Interval
{
    int low;
    int high;
};

struct TNode
{
    COLOR color;
    TNode* left;
    TNode* right;
    TNode* p;
    Interval interval;
    int max;
};

struct RBTree
{
    TNode* root;
    TNode* nil;
};

void RB_INSERT_FIXUP(RBTree* T,TNode* z);
void RB_INSERT(RBTree* T,TNode* z);
void LEFT_ROTATE(RBTree* T,TNode* x);
void RIGHT_ROTATE(RBTree* T,TNode* x);
int max(int a,int b,int c);
void Interval_search(TNode* T,TNode* nil,Interval i);
void LNR_tree(TNode* T,TNode* nil);
int main()
{
    int i=0;
    int size=0;
    struct RBTree Tree;
    struct RBTree* T=&Tree;
    TNode nil;
    nil.color=BLACK;
    nil.max = 0;
    nil.p=&nil;
    nil.right=&nil;
    nil.left=&nil;
    Tree.nil=&nil;
    Tree.root=&nil;
    ifstream  fin("./insert.txt",ios::in);
    fin >> size;
    while (!fin.eof() && i<size)
	{
        TNode* z=(TNode*)malloc(sizeof(TNode));
		fin >> z->interval.low >> z->interval.high;
        z->max = 0;
		i++;
        z->left=T->nil;
        z->right=T->nil;
        RB_INSERT(T,z);
	}
    LNR_tree(T->root,T->nil);
    cout<<"enter a interval[low high]"<<endl;
    Interval interval;
    cin >> interval.low >> interval.high;
    Interval_search(T->root,T->nil,interval);
    system("pause");
    return 0;
}

void RB_INSERT(RBTree* T,TNode* z)
{
    TNode* y=T->nil;
    TNode* x=T->root;
    while (x!=T->nil)
    {
        y=x;
        if(z->interval.low<x->interval.low)
        {
            x=x->left;
        }
        else
        {
            x=x->right;
        }
    }
    z->p=y;
    if (y == T->nil)
    {
        T->root=z;
    }
    else if(z->interval.low<y->interval.low)
    {
        y->left=z;
    }
    else
    {
        y->right=z;
    }
    z->left=T->nil;
    z->right=T->nil;
    z->color=RED;
    TNode* midnode = z;
    while (midnode != T->nil) {
        midnode->max = max(midnode->interval.high, midnode->left->max, midnode->right->max);
        midnode = midnode->p;
    }
    RB_INSERT_FIXUP(T,z);
}

void RB_INSERT_FIXUP(RBTree* T,TNode* z)
{
    TNode* y;
    while (z->p->color == RED)
    {
        if (z->p == z->p->p->left)
        {
            y=z->p->p->right;
            if(y->color == RED)
            {
                z->p->color=BLACK; //case 1
                y->color=BLACK;    //case 1
                z->p->p->color=RED;//case 1
                z=z->p->p;         //case 1
                cout<<"case 1"<<endl;
            }
            else 
            {
                if(z==z->p->right)
                {
                    z=z->p;          //case 2
                    LEFT_ROTATE(T,z);//case 2
                    cout<<"case 2"<<endl;
                }
                z->p->color = BLACK;  //case 3
                z->p->p->color = RED; //case 3
                RIGHT_ROTATE(T,z->p->p);
                cout<<"case 3"<<endl;
            }
        }
        else
        {
            y=z->p->p->left;
            if(y->color == RED)
            {
                z->p->color=BLACK; //case 4
                y->color=BLACK;    //case 4
                z->p->p->color=RED;//case 4
                z=z->p->p;         //case 4
                cout<<"case 4"<<endl;
            }
            else 
            {
                if(z==z->p->left)
                {
                    z=z->p;            //case 5
                    RIGHT_ROTATE(T,z);  //case 5
                    cout<<"case 5"<<endl;
                }
                z->p->color = BLACK;   //case 6
                z->p->p->color = RED;  //case 6
                LEFT_ROTATE(T,z->p->p);
                cout<<"case 6"<<endl;
            }
        }
    }
    T->root->color = BLACK;
}

void LEFT_ROTATE(RBTree* T,TNode* x)
{
    TNode* y=x->right;
    x->right=y->left;
    if(y->left != T->nil)
    {
        y->left->p = x;
    }
    y->p=x->p;
    if(x->p == T->nil)
    {
        T->root = y;
    }
    else if(x == x->p->left)
    {
        x->p->left = y;
    }
    else
    {
        x->p->right = y; 
    }
    y->left = x;
    x->p = y;
    x->max = max(x->interval.high, x->left->max, x->right->max);
    y->max = max(y->interval.high,y->left->max,y->right->max);
}

void RIGHT_ROTATE(RBTree* T,TNode* x)
{
    TNode* y=x->left;
    x->left=y->right;
    if(y->right != T->nil)
    {
        y->right->p = x;
    }
    y->p=x->p;
    if(x->p == T->nil)
    {
        T->root=y;
    }
    else if (x == x->p->left)
    {
        x->p->left = y;
    }
    else
    {
        x->p->right = y;
    }
    y->right = x;
    x->p = y;
    x->max = max(x->interval.high, x->left->max, x->right->max);
    y->max = max(y->interval.high,y->left->max,y->right->max);
}

int max(int a,int b,int c)
{
    int ans=0;
    if(a>b)
    {
        ans = a;
    }
    else
    {
        ans = b;
    }
    if(ans < c)
    {
        ans = c;
    }
    return ans;
}

void Interval_search(TNode* T,TNode* nil,Interval i)
{
    if(T!=nil)
    {
        Interval_search(T->left,nil,i);
        if(i.high>=T->interval.low && i.low <=T->interval.high)
        {
            cout<<"["<<T->interval.low<<","<<T->interval.high<<"]"<<endl;
        }
        Interval_search(T->right,nil,i);
    }
}

void LNR_tree(TNode* T,TNode* nil)
{
    ofstream fout;
	fout.open("./LNR.txt",ios::app);
    if(T!=nil)
    {
        LNR_tree(T->left,nil);
        if(T->color == RED)
        {
            fout<<"red";
        }
        else
        {
            fout<<"black";
        }
        fout<<",max:"<<T->max<<",interval: ["<<T->interval.low<<","<<T->interval.high<<"]"<<endl;
        LNR_tree(T->right,nil);
    }
}