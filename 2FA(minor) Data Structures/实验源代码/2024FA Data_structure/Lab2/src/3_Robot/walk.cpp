#include "walk.h"
#include <iostream>
namespace DATA_STRUCTURE {

void walk::print_para() {
    std::cout << steps << std::endl;
    for (int i = 0; i < gold_num; i++) {
        std::cout << *(gold + 2 * i) << " " << *(gold + 2 * i + 1) << " " << *(gold_value + i) << std::endl;
    }
}

int walk::compute_distance(int i, int x, int y) {
    // TODO
    int stepx = abs(*(gold + 2 * i)- x) / 2 + abs(*(gold + 2 * i)-x) % 2;
    int stepy = abs(*(gold + 2 * i + 1)- y) / 2 + abs(*(gold + 2 * i + 1) - y) % 2;
    return stepx + stepy;
}

int walk::get_value() {
    int max_value = 0;
    // TODO
    q.clear();
    element start = {0, 0, 0, 0, {}};
    q.push(start);
    while (!q.empty()) 
    {
        element now = q.top();
        q.pop();
        if (now.steps <= steps)
        {
            if(now.value > max_value)
            {
                max_value = now.value;
            }
            for (int i = 0; i < gold_num ; i++) 
            {
                if (now.get_gold.find(i))
                {
                    continue;
                }
                int distance = compute_distance(i, now.x, now.y);
                if (now.steps + distance <= steps) 
                {
                    element next = now;
                    next.steps += distance;
                    next.value += *(gold_value + i);
                    next.x = *(gold + 2 * i);
                    next.y = *(gold + 2 * i + 1);
                    next.get_gold.insert(i);
                    q.push(next);
                }
            }
        }
    }
    return max_value;
}
}

