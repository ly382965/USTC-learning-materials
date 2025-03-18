#pragma once

#include "list.h"

namespace DATA_STRUCTURE {

template<class data_base>
class stack : public list<data_base> {
    public:
        stack() = default;
        ~stack() = default;

        bool empty() override {
            // TODO
            if(top_index == 0)
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
            if(top_index > 0)
            {
                top_index--;
            }
        }
        data_base top() override {
            // TODO
            data_base tmp;
            if(top_index > 0)
            {
                tmp=list_data[top_index - 1];
            }
            return tmp;
        }
        void push(data_base push_data) override {
            // TODO
            if(top_index < MAX_LINK_LIST_NUM-1)
            {
                list_data[top_index]=push_data;
                top_index++;
            }
        }
        void clear() override {
            // TODO
            top_index = 0;
        }
    private:
        int top_index = 0;
        data_base list_data[MAX_LINK_LIST_NUM];
};

}
