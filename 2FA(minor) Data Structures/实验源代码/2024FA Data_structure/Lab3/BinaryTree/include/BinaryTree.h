// BinaryTree.h
#ifndef BINARYTREE_H
#define BINARYTREE_H

#include <string>
#include <vector>
#include <unordered_map>

using namespace std;

class BinaryTreeNode
{
public:
    string name;           // 节点的名字，如 A, B, C, D 等
    BinaryTreeNode* left;  // 二叉树左孩子
    BinaryTreeNode* right; // 二叉树右孩子

public:
    // 构造函数，初始化左、右孩子为空
    BinaryTreeNode(); 

    // 默认析构函数
    ~BinaryTreeNode() = default;

    // 先序遍历，遍历顺序：根 -> 左子树 -> 右子树
    // 参数:
    //    root - 当前遍历的二叉树根节点
    virtual void PreOrderTraverse(BinaryTreeNode* root);

    // 中序遍历，遍历顺序：左子树 -> 根 -> 右子树
    // 参数:
    //    root - 当前遍历的二叉树根节点
    virtual void InOrderTraverse(BinaryTreeNode* root);

    // 后序遍历，遍历顺序：左子树 -> 右子树 -> 根
    // 参数:
    //    root - 当前遍历的二叉树根节点
    virtual void PostOrderTraverse(BinaryTreeNode* root);

    // 层次遍历，按层次从上到下逐层遍历
    // 参数:
    //    root - 当前遍历的二叉树根节点
    virtual void LevelOrderTraverse(BinaryTreeNode* root);

    // 根据中序遍历和后序遍历结果重建二叉树
    // 参数:
    //    inorder - 中序遍历的节点值序列
    //    postorder - 后序遍历的节点值序列
    // 返回:
    //    返回重建的二叉树根节点
    static BinaryTreeNode* buildTreeFromInorderPostorder(const vector<string>& inorder, 
                                                         const vector<string>& postorder);

    // 根据中序遍历和前序遍历结果重建二叉树
    // 参数:
    //    inorder - 中序遍历的节点值序列
    //    preorder - 前序遍历的节点值序列
    // 返回:
    //    返回重建的二叉树根节点
    static BinaryTreeNode* buildTreeFromInorderPreorder(const vector<string>& inorder, 
                                                        const vector<string>& preorder);

    // 获取节点的值
    // 返回:
    //    默认返回当前节点的名字
    virtual string getValue();

    // 辅助函数：根据中序遍历和前序遍历重建二叉树
    // 参数:
    //    inorder - 中序遍历的节点值序列
    //    inStart - 当前子树中序遍历的开始位置
    //    inEnd - 当前子树中序遍历的结束位置
    //    preorder - 前序遍历的节点值序列
    //    preStart - 当前子树前序遍历的开始位置
    //    preEnd - 当前子树前序遍历的结束位置
    //    inorderMap - 用于快速查找中序遍历节点的值到索引的映射
    // 返回:
    //    返回构建的二叉树子树的根节点
    static BinaryTreeNode* buildTreeFromInorderPreorderHelper(const vector<string>& inorder, 
                                                              int inStart, int inEnd, 
                                                              const vector<string>& preorder, 
                                                              int preStart, int preEnd, 
                                                              unordered_map<string, int>& inorderMap);

    // 辅助函数：根据中序遍历和后序遍历重建二叉树
    // 参数:
    //    inorder - 中序遍历的节点值序列
    //    inStart - 当前子树中序遍历的开始位置
    //    inEnd - 当前子树中序遍历的结束位置
    //    postorder - 后序遍历的节点值序列
    //    postStart - 当前子树后序遍历的开始位置
    //    postEnd - 当前子树后序遍历的结束位置
    //    inorderMap - 用于快速查找中序遍历节点的值到索引的映射
    // 返回:
    //    返回构建的二叉树子树的根节点
    static BinaryTreeNode* buildTreeFromInorderPostorderHelper(const vector<string>& inorder, 
                                                               int inStart, int inEnd, 
                                                               const vector<string>& postorder, 
                                                               int postStart, int postEnd, 
                                                               unordered_map<string, int>& inorderMap);
};

#endif // BINARYTREE_H
