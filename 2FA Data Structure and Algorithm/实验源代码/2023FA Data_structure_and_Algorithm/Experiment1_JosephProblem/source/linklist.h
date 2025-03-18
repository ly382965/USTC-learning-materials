#define LIST_INIT_SIZE 100
#define LIST_INC_SIZE 20
typedef int ElemType; //ElemType 定义为char类型
typedef struct LNode{
ElemType data;
ElemType sequence;
struct LNode *next;
}LNode,*LinkList;
int ListLength_L(LinkList L);
void createJosephList(LinkList &L);
void printJosephList(LinkList &L,int m);
ElemType pop_L(LinkList &L,int times);
/*
//初始化链表
void InitList_L(LinkList &L);
//销毁链表
void DestroyList_L(LinkList &L);
//判断链表是否为空
bool ListEmpty_L(LinkList L);
//求链表长度

//查找元素
int LocateItem_L (LinkList L,ElemType e);
//获取元素
bool GetItem_L(LinkList L,int i,ElemType &e);
//插入元素
bool ListInsert_L(LinkList &L,int i);
//删除元素
bool ListDelete_L(LinkList &L,int i,ElemType &e);
//遍历元素
void ListTraverse_L(LinkList L);

ElemType ListPop_L(LinkList L,int i);
*/