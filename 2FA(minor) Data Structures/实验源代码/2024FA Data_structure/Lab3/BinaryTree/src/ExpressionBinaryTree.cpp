#include "../include/ExpressionBinaryTree.h"
#include <stdexcept>

using namespace std;

// 构造函数，初始化节点的值
ExpressionBinaryTreeNode::ExpressionBinaryTreeNode(string val) : value(val) {}

// 获取节点的值
string ExpressionBinaryTreeNode::getValue() {
    return value;
}

// 从后缀表达式构建表达式树
// 参数:
//    postfix - 后缀表达式字符串
// 返回:
//    返回构建的表达式树根节点
ExpressionBinaryTreeNode* ExpressionBinaryTreeNode::buildFromPostfix(const string& postfix) {
    // TODO
    stack<ExpressionBinaryTreeNode*> strStack;  // 存储字符的栈
    for (size_t i = 0; i < postfix.size(); ++i) 
    {
        char ch = postfix[i];
        if (isdigit(ch)) 
        {
            ExpressionBinaryTreeNode* node = new ExpressionBinaryTreeNode(string(1, ch));
            node->left=NULL;
            node->right=NULL;
            strStack.push(node);
        }
        else
        {
            ExpressionBinaryTreeNode* node = new ExpressionBinaryTreeNode(string(1, ch));
            node->left=NULL;
            node->right=NULL;
            if(!strStack.empty())
            {
                node->right=strStack.top();
                strStack.pop();
            }
            if(!strStack.empty())
            {
                node->left=strStack.top();
                strStack.pop();
            }
            strStack.push(node);
        }
    }
    return strStack.top();
}

// 从前缀表达式构建表达式树
// 参数:
//    prefix - 前缀表达式字符串
// 返回:
//    返回构建的表达式树根节点
ExpressionBinaryTreeNode* ExpressionBinaryTreeNode::buildFromPrefix(const string& prefix) {
    // TODO
    if(prefix.size()==0)
    {
        return NULL;
    }
    stack<ExpressionBinaryTreeNode*> operateStack;  // 存储运算符的栈
    ExpressionBinaryTreeNode* root = new ExpressionBinaryTreeNode(string(1, prefix[0]));
    root->left=NULL;
    root->right=NULL;
    operateStack.push(root);
    for (size_t i = 1; i < prefix.size(); ++i) 
    {
        char ch = prefix[i];
        if (isdigit(ch)) 
        {
            ExpressionBinaryTreeNode* node = new ExpressionBinaryTreeNode(string(1, ch));
            if(!operateStack.empty())
            {
                ExpressionBinaryTreeNode* topnode=operateStack.top();
                if(!topnode->left)
                {
                    topnode->left=node;
                }
                else if(!topnode->right)
                {
                    topnode->right=node;
                }
                if(topnode->right && topnode->left)
                {
                    operateStack.pop();
                }
            }
        }
        else
        {
            ExpressionBinaryTreeNode* node = new ExpressionBinaryTreeNode(string(1, ch));
            node->left=NULL;
            node->right=NULL;
            if(!operateStack.empty())
            {
                ExpressionBinaryTreeNode* topnode=operateStack.top();
                if(!topnode->left)
                {
                    topnode->left=node;
                }
                else if(!topnode->right)
                {
                    topnode->right=node;
                }
                if(topnode->right && topnode->left)
                {
                    operateStack.pop();
                }
            }
            operateStack.push(node);
        }
    }
    return root;
}

// 从中缀表达式构建表达式树
// 参数:
//    infix - 中缀表达式字符串
// 返回:
//    返回构建的表达式树根节点
// 由于上次的实验写过，为了减轻大家的负担，不用实现中缀表达式树的构建，以下代码供大家参考
ExpressionBinaryTreeNode* ExpressionBinaryTreeNode::buildFromInfix(const string& infix) {
    stack<ExpressionBinaryTreeNode*> operandStack;  // 存储操作数的栈
    stack<char> operatorStack;  // 存储运算符的栈
    
    for (size_t i = 0; i < infix.size(); ++i) {
        char ch = infix[i];
        
        if (isdigit(ch)) {
            // 如果是数字，创建新的操作数节点并压入操作数栈
            operandStack.push(new ExpressionBinaryTreeNode(string(1, ch)));
        } else if (ch == '(') {
            // 如果是左括号，直接入运算符栈
            operatorStack.push(ch);
        } else if (ch == ')') {
            // 如果是右括号，弹出运算符直到遇到左括号
            while (!operatorStack.empty() && operatorStack.top() != '(') {
                char op = operatorStack.top();
                operatorStack.pop();
                ExpressionBinaryTreeNode* right = operandStack.top();
                operandStack.pop();
                ExpressionBinaryTreeNode* left = operandStack.top();
                operandStack.pop();
                ExpressionBinaryTreeNode* node = new ExpressionBinaryTreeNode(string(1, op));
                node->left = left;
                node->right = right;
                operandStack.push(node);
            }
            // 弹出左括号
            if (!operatorStack.empty() && operatorStack.top() == '(') {
                operatorStack.pop();
            }
        } else if (ch == '+' || ch == '-' || ch == '*' || ch == '/') {
            // 处理运算符
            while (!operatorStack.empty() && getPrecedence(operatorStack.top()) >= getPrecedence(ch)) {
                char op = operatorStack.top();
                operatorStack.pop();
                ExpressionBinaryTreeNode* right = operandStack.top();
                operandStack.pop();
                ExpressionBinaryTreeNode* left = operandStack.top();
                operandStack.pop();
                ExpressionBinaryTreeNode* node = new ExpressionBinaryTreeNode(string(1, op));
                node->left = left;
                node->right = right;
                operandStack.push(node);
            }
            operatorStack.push(ch);
        }
    }

    // 处理剩余的运算符
    while (!operatorStack.empty()) {
        char op = operatorStack.top();
        operatorStack.pop();
        ExpressionBinaryTreeNode* right = operandStack.top();
        operandStack.pop();
        ExpressionBinaryTreeNode* left = operandStack.top();
        operandStack.pop();
        ExpressionBinaryTreeNode* node = new ExpressionBinaryTreeNode(string(1, op));
        node->left = left;
        node->right = right;
        operandStack.push(node);
    }

    // 返回最终构建好的表达式树的根节点
    return operandStack.top();
}

// 获取运算符的优先级
// 参数:
//    op - 运算符字符
// 返回:
//    返回运算符的优先级，数字越大优先级越高
int ExpressionBinaryTreeNode::getPrecedence(char op) {
    if (op == '+' || op == '-') return 1;  // 加减优先级较低
    if (op == '*' || op == '/') return 2;  // 乘除优先级较高
    return INT_MAX;  // 不支持的运算符返回最大优先级
}

// 计算表达式树的值
// 返回:
//    返回表达式树的计算结果
int ExpressionBinaryTreeNode::evaluate() {
    // 如果是叶节点（没有子节点），则直接返回该节点的数字值
    if (!left && !right) {
        return stoi(value);  // 使用stoi将字符串转换为整数
    }
    
    // 否则递归计算左右子树的值
    int leftVal = dynamic_cast<ExpressionBinaryTreeNode*>(left)->evaluate();    
    int rightVal = dynamic_cast<ExpressionBinaryTreeNode*>(right)->evaluate();
    
    // 根据当前节点的运算符计算值
    if (value == "+") return leftVal + rightVal;
    if (value == "-") return leftVal - rightVal;
    if (value == "*") return leftVal * rightVal;
    if (value == "/") return leftVal / rightVal;
    
    // 如果是无效的运算符，抛出异常
    throw invalid_argument("Invalid operator");
}
