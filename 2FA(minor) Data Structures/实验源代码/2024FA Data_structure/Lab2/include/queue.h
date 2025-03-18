#pragma once

#include "list.h"

namespace DATA_STRUCTURE {

template<class data_base>
class queue : public list<data_base> {
    public:
        queue() = default;
        ~queue() = default;

        bool empty() override {
            // TODO
            if(top_index == tail_index)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        void pop() override {
            // TODO
            if(top_index < tail_index)
            {
                top_index=(top_index + 1)% MAX_LINK_LIST_NUM;
            }
        }
        data_base top() override {
            // TODO
            data_base tmp;
            if(top_index <= tail_index)
            {
                tmp=list_data[top_index - 1];
            }
            return tmp;
        }
        void push(data_base push_data) override {
            // TODO
            if((tail_index + 1) % MAX_LINK_LIST_NUM != top_index)
            {
                list_data[tail_index]=push_data;
                tail_index=(tail_index + 1) % MAX_LINK_LIST_NUM;
            }
        }
        void clear() override {
            // TODO
            top_index = 0;
            tail_index = 0;
        }
    private:
        int top_index = 0;
        int tail_index = 0;
        data_base list_data[MAX_LINK_LIST_NUM];
};

}
