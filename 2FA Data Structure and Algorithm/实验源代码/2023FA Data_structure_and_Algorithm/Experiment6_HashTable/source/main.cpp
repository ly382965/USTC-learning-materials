#include <iostream>
#include <stdio.h>
#include <string.h>
#include "hash.h"

int main()
{ 
    int i=0;
    char *keywords[] = {"void",     "int",     "for",    "char",  "if",
                          "else",     "do",      "switch", "case",  "break",
                          "continue", "default", "struct", "union", "enum",
                          "typedef",  "goto"};
    int mainnum[KEYWORDS_LENGTH]={0};
    int difnum[KEYWORDS_LENGTH]={0};
    int simnum[KEYWORDS_LENGTH]={0};

    LinkHashList HT;
    Init(HT,keywords);
    TraverseHT(HT);

    FILE *fp=NULL;
    fp=fopen("D:\\Codes\\Codes_Cpp\\Experiment6_HashTable\\source\\main.txt","r");
    search(HT,fp,mainnum);
    fclose(fp);

    fp=fopen("D:\\Codes\\Codes_Cpp\\Experiment6_HashTable\\source\\different.txt","r");
    search(HT,fp,difnum);
    fclose(fp);

    fp=fopen("D:\\Codes\\Codes_Cpp\\Experiment6_HashTable\\source\\similar.txt","r");
    search(HT,fp,simnum);
    fclose(fp);
    printf("main:\n");
    for(i=0;i<KEYWORDS_LENGTH;i++)
    {
        printf("%s:%d\n",keywords[i],mainnum[i]);
    }

    printf("\ndifferent:\n");
    for(i=0;i<KEYWORDS_LENGTH;i++)
    {
        printf("%s:%d\n",keywords[i],difnum[i]);
    }
    printf("\nsimilar:\n");
    for(i=0;i<KEYWORDS_LENGTH;i++)
    {
        printf("%s:%d\n",keywords[i],simnum[i]);
    }
    printf("main-different相似值:");
    printf("%lf\n",calculate(mainnum,difnum));
    printf("main-different距离:");
    printf("%lf\n",distance(mainnum,difnum));
    printf("main-similar相似值:");
    printf("%lf\n",calculate(mainnum,simnum));
    printf("main-different距离:");
    printf("%lf\n",distance(mainnum,simnum));
    getchar();

    return 0;
}

