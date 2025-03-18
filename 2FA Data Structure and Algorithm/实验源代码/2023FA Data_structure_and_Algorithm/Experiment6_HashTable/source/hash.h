typedef char* ElemType;
typedef struct LNode{
    ElemType data;
    int num;
    struct LNode *next;
}LNode,**ppLNode;

typedef struct{
    ppLNode head;
    int length;
}LinkHashList;

#define KEYWORDS_LENGTH 17

int HashFunc(LinkHashList HT,ElemType e); //哈希函数
void InitHashList(LinkHashList &HT,int m); //创建哈希表
void DestroyHashList(LinkHashList &HT); //销毁哈希表
void InsertHT(LinkHashList &HT,ElemType e,int i); //插入元素
void DeleteHT(LinkHashList &HT,ElemType &e); //删除元素
LNode *SearchHT(LinkHashList HT,ElemType e); //查找元素
void TraverseHT(LinkHashList HT); //遍历哈希表
void Init(LinkHashList &HT,char** keywords);
void search(LinkHashList HT,FILE *fp,int *num);
double calculate(int *xi,int *xj);
double distance(int *xi,int *xj);