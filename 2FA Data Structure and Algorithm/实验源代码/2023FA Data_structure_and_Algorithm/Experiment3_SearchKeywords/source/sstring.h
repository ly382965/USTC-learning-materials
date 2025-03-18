#define MAX_STR_LEN 4000
typedef char SString[MAX_STR_LEN +1];
int strlength(SString S);
void get_next(char *p,int *next);
bool index(char *s,char *p,int start,int *next);