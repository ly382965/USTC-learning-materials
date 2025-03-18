#ifndef HUFFMANTREE_H
#define HUFFMANTREE_H

#include "BinaryTree.h"
#include <iostream>
#include <queue>
#include <unordered_map>
#include <vector>
#include <string>

using namespace std;

// 哈夫曼树节点
class HuffmanTreeNode : public BinaryTreeNode {
public:
    char character; // 存储字符
    int frequency;  // 存储字符频率

    // 默认构造函数
    // 将字符设置为 '\0'，频率为 0，左右孩子指针初始化为空
    HuffmanTreeNode() : character('\0'), frequency(0) {
        left = right = nullptr;
    }
    
    // 构造函数
    // 参数:
    //    ch - 节点的字符
    //    freq - 节点的频率
    HuffmanTreeNode(char ch, int freq);

    // 默认析构函数
    ~HuffmanTreeNode() = default;

    // 重写基类中的 getValue 方法，返回字符
    // 返回:
    //    返回当前节点的字符值
    string getValue() override;
    
    // 比较节点频率，用于优先队列（最小堆）
    // 参数:
    //    other - 另一个 HuffmanTreeNode 节点
    // 返回:
    //    如果当前节点的频率大于 `other` 节点的频率，返回 true
    struct freq_cmp
    {
        // 比较节点频率，用于优先队列（最小堆）
        bool operator() (HuffmanTreeNode* lhs, HuffmanTreeNode* rhs) const {
            return lhs->frequency > rhs->frequency;
        }
    };

    // 获取节点频率
    // 返回:
    //    返回当前节点的频率
    int getFrequency() const;

    // 构建哈夫曼树
    // 参数:
    //    freqMap - 字符及其对应频率的映射
    // 返回:
    //    返回构建的哈夫曼树的根节点
    static HuffmanTreeNode* buildHuffmanTree(const unordered_map<char, int>& freqMap);

    // 打印哈夫曼树的编码（先序遍历）
    // 参数:
    //    root - 哈夫曼树的根节点
    //    code - 当前节点的编码字符串，默认为空字符串
    // 返回:
    //    无返回值，递归打印编码
    static void printHuffmanCodes(HuffmanTreeNode* root, string code = "");
};

#endif // HUFFMANTREE_H
