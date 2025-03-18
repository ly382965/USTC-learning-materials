#define STACK_INIT_SIZE 100
typedef int SElemType; //ElemType 定义为int类型
typedef struct{
SElemType * elem;
SElemType * time;
int    stacksize;
int    top;
}SqStack;
//初始化栈
bool InitStack_sq(SqStack &S,int msize=STACK_INIT_SIZE);
//销毁栈
void DestroyStack_sq(SqStack &S);
//清空栈
void ClearStack_sq(SqStack &S);
//判断栈是否为空
bool StackEmpty_sq(SqStack S);
//判断栈是否满
bool StackFull_sq(SqStack S);
//求栈长度
int StackLength_sq(SqStack S);
//获取栈顶元素
bool GetTop_sq(SqStack S,SElemType &e,SElemType &time);
//元素入栈
bool Push_sq(SqStack &S, SElemType e,SElemType time);
//元素出栈
bool Pop_sq(SqStack &S,SElemType &e,SElemType &time);
//遍历元素
void StackTraverse_sq(SqStack S);
