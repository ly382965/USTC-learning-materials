#ifndef EXPRESSIONBINARYTREE_H
#define EXPRESSIONBINARYTREE_H

#include "../include/BinaryTree.h"
#include <stack>

class ExpressionBinaryTreeNode : public BinaryTreeNode {
public:
    string value; // 节点值，通常是运算符或操作数

    // 构造函数，初始化节点值
    // 参数:
    //    val - 节点的值，通常是运算符或操作数
    ExpressionBinaryTreeNode(string val);

    // 默认析构函数
    ~ExpressionBinaryTreeNode() = default;

    // 获取节点的值
    // 重写基类中的 getValue() 方法
    // 返回:
    //    返回节点的值
    string getValue() override;

    // 从后缀表达式构建表达式树
    // 参数:
    //    postfix - 后缀表达式字符串，表达式中的操作符与操作数已按后缀顺序排列
    // 返回:
    //    返回构建的表达式树根节点
    static ExpressionBinaryTreeNode* buildFromPostfix(const string& postfix);

    // 从前缀表达式构建表达式树
    // 参数:
    //    prefix - 前缀表达式字符串，操作符位于操作数之前
    // 返回:
    //    返回构建的表达式树根节点
    static ExpressionBinaryTreeNode* buildFromPrefix(const string& prefix);

    // 从中缀表达式构建表达式树
    // 参数:
    //    infix - 中缀表达式字符串，操作符位于操作数之间，可能包含括号
    // 返回:
    //    返回构建的表达式树根节点
    static ExpressionBinaryTreeNode* buildFromInfix(const string& infix);

    // 获取操作符的优先级
    // 参数:
    //    op - 操作符字符，如 '+', '-', '*', '/' 等
    // 返回:
    //    返回操作符的优先级，数字越大优先级越高
    static int getPrecedence(char op);

    // 计算表达式树的值
    // 返回:
    //    返回表达式树所表示的数学表达式的计算结果
    int evaluate();
};

#endif
