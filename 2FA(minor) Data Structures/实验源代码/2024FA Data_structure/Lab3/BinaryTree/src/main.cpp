#include <iostream>
#include <string>
#include <unordered_map>
#include "../include/BinaryTree.h"
#include "../include/ExpressionBinaryTree.h"
#include "../include/HuffmanTree.h"

using namespace std;

void testBinaryTreeTraversal() {
    // 测试从中序和前序构建二叉树
    vector<string> inorder = {"D", "B", "E", "A", "F", "C"};
    vector<string> preorder = {"A", "B", "D", "E", "C", "F"};
    BinaryTreeNode* treeFromPreIn = BinaryTreeNode::buildTreeFromInorderPreorder(inorder, preorder);

    cout << "\nBuilt Tree from Inorder and Preorder:" << endl;
    cout << "PostOrder Traversal: ";
    treeFromPreIn->PostOrderTraverse(treeFromPreIn);
    cout << endl;

    // 测试从中序和后序构建二叉树
    vector<string> postorder = {"D", "E", "B", "F", "C", "A"};
    BinaryTreeNode* treeFromInPost = BinaryTreeNode::buildTreeFromInorderPostorder(inorder, postorder);

    cout << "\nBuilt Tree from Inorder and Postorder:" << endl;
    cout << "PreOrder Traversal: ";
    treeFromInPost->PreOrderTraverse(treeFromInPost);
    cout << endl;
}

void testExpressionBinaryTree() {
    // 创建后缀表达式并构建表达式二叉树
    string postfix = "23*54*+";
    ExpressionBinaryTreeNode* expTreePostfix = ExpressionBinaryTreeNode::buildFromPostfix(postfix);
    cout << "Expression Tree from Postfix (23*54*+):" << endl;
    expTreePostfix->InOrderTraverse(expTreePostfix);
    cout << " = " << expTreePostfix->evaluate() << endl;

    // 创建前缀表达式并构建表达式二叉树
    string prefix = "+*23*54";
    ExpressionBinaryTreeNode* expTreePrefix = ExpressionBinaryTreeNode::buildFromPrefix(prefix);
    cout << "Expression Tree from Prefix (+*23*54):" << endl;
    expTreePrefix->InOrderTraverse(expTreePrefix);
    cout << " = " << expTreePrefix->evaluate() << endl;

    // 创建中缀表达式并构建表达式二叉树
    string infix = "2*3+5*4";
    ExpressionBinaryTreeNode* expTreeInfix = ExpressionBinaryTreeNode::buildFromInfix(infix);
    cout << "Expression Tree from Infix (2*3+5*4):" << endl;
    expTreeInfix->InOrderTraverse(expTreeInfix);
    cout << " = " << expTreeInfix->evaluate() << endl;
}

void testHuffmanTree() {
    // 字符和频率的映射
    unordered_map<char, int> freqMap = {{'a', 5}, {'b', 9}, {'c', 12}, {'d', 13}, {'e', 16}, {'f', 45}};
    
    // 构建哈夫曼树
    HuffmanTreeNode huffmanTree;
    HuffmanTreeNode* root = huffmanTree.buildHuffmanTree(freqMap);
    
    // 打印哈夫曼编码
    cout << "Huffman Codes:" << endl;
    huffmanTree.printHuffmanCodes(root);
}

int main() {
    cout << "Testing Binary Tree Traversal:" << endl;
    testBinaryTreeTraversal();
    cout << endl;

    cout << "Testing Expression Binary Tree:" << endl;
    testExpressionBinaryTree();
    cout << endl;

    cout << "Testing Huffman Tree:" << endl;
    testHuffmanTree();
    cout << endl;

    return 0;
}
