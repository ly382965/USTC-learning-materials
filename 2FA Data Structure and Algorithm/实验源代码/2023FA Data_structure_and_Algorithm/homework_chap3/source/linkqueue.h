#define QUEUE_INIT_SIZE 100
#include "linklist.h"
typedef char QElemType; //ElemType 定义为char类型
typedef LinkList Queueptr; //结点指针
typedef struct{
Queueptr front;
Queueptr rear;
}LinkQueue; //链队列定义
//初始化队列
bool InitQueue_L(LinkQueue &Q);
//销毁队列
void DestroyQueue_L(LinkQueue &Q);
//清空队列
void ClearQueue_L(LinkQueue &Q);
//判断队列是否为空
bool QueueEmpty_L(LinkQueue Q);
//求队列长度
int QueueLength_L(LinkQueue Q);
//获取队首元素
bool GetHead_L(LinkQueue Q,QElemType &e);
//元素入队列
bool EnQueue_L(LinkQueue &Q, QElemType e);
//元素出队列
bool DeQueue_L(LinkQueue &Q,QElemType &e);
//遍历元素
void QueueTraverse_L(LinkQueue Q);