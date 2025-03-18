#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include "linklist.h"
using namespace std;
int main()
{
    LinkList L;
    ElemType m;
    L=NULL;
    createJosephList(L);
    cout<<"输入m：";
    cin>>m;
    printJosephList(L,m);
    getchar();
    getchar();
}
