#pragma once

#define MAX_LINK_LIST_NUM 1001

namespace DATA_STRUCTURE {

template<class data_base>
class list {
    public:
        struct data{
            int x, y;
            int key;
        };
    public:
        virtual ~list() = default;
        virtual void pop() = 0;
        virtual data_base top() = 0;
        virtual void push(data_base push_data) = 0;
        virtual bool empty() = 0;
        virtual void clear() = 0;
};

}
