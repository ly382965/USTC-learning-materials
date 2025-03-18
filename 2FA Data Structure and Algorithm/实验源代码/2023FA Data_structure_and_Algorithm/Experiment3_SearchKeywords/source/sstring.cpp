#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include "sstring.h"
using namespace std;
int strlength(SString S)
{
    int i=0;
    while(S[i]!='\0')
    {
        i++;
    }
    return i;
}
bool index(char *s,char *p,int start,int *next)
{
    if(start<0||start>strlength(s)-strlength(p))
    {
        return false;
    }
    int i=start,j=0;
    while (i<strlength(s)&&j<strlength(p))
    {
        if(j==-1||s[i]==p[j])
        {
            i++;j++;
        }
        else
        {
            j=next[j];
        }
    }
    if(j==strlength(p))
    {
        return true;
    }
    return false;
}
void get_next(char *p,int *next)
{
    int j=0,k=-1;
    next[0]=-1;
    while (j<=strlength(p)-1)
    {
        if(k==-1||(p[j]==p[k]))
        {
            j++;k++;
            if(p[j]!=p[k])
            {
                next[j]=k;
            }
            else
            {
                next[j]=next[k];
            }
        }
        else
        {
            k=next[k];
        }
    }
}
