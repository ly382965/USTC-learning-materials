#include "../include/HuffmanTree.h"

// 构造函数
HuffmanTreeNode::HuffmanTreeNode(char ch, int freq) : character(ch), frequency(freq) {
    left = right = nullptr;
}

// 重写 getValue 方法，返回字符
string HuffmanTreeNode::getValue() {
    return string(1, character);  // 返回字符
}

// 获取节点频率
int HuffmanTreeNode::getFrequency() const {
    return frequency;
}

// 构建哈夫曼树
HuffmanTreeNode* HuffmanTreeNode::buildHuffmanTree(const unordered_map<char, int>& freqMap) {
    // 创建最小堆
    priority_queue<HuffmanTreeNode*, vector<HuffmanTreeNode*>, freq_cmp> minHeap;

    // 将所有字符和频率加入堆中
    // TODO
    auto i=freqMap.begin();
    while (i!=freqMap.end()) 
    {
        HuffmanTreeNode* node = new HuffmanTreeNode;
        node->character=i->first;
        node->frequency=i->second;
        node->left=NULL;
        node->right=NULL;
        minHeap.push(node);
        i++;
    }
    // 合并最小的两个节点，直到堆中只剩下一个节点
    // TODO
    while (minHeap.size() > 1)
    {
        HuffmanTreeNode* newnode = new HuffmanTreeNode;
        newnode->left = minHeap.top();
        minHeap.pop();
        newnode->right = minHeap.top();
        minHeap.pop();
        minHeap.push(newnode);
    }
    
    // 返回哈夫曼树的根节点
    return minHeap.top();
}

// 打印哈夫曼树的编码（先序遍历）
void HuffmanTreeNode::printHuffmanCodes(HuffmanTreeNode* root, string code) {
    // TODO
    if(!root->left && !root->right)
    {
        cout<<"字符"<<root->character<<":"<< code << endl;
    }
    else
    {
        if(root->left)
        {
            string leftcode=code + "0";
            printHuffmanCodes((HuffmanTreeNode*)root->left,leftcode);
        }
        if(root->right)
        {
            string rightcode=code + "1";
            printHuffmanCodes((HuffmanTreeNode*)root->right,rightcode);
        }
    }
}
