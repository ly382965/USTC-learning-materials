#include <iostream>

// .h is okay here, please don't include the 'cpp's here
#include "stack.h"
#include "queue.h"

// Maybe add the following line to the program, it announces the namespace of the rest of the program. You may see another way in list.h
// using namespace std;

int main() {
    // Initialize a practice of a class, in this case a stack or a queue
    DATA_STRUCTURE::stack<int> p;

    // Push 0 to 9 into the structure
    int n = 10;
    for (int i = 0; i < n; i++)
        p.push(i);
    
    // Check if the structure is empty
    // Actually it has to be not empty because we have just push 10 items into the structure
    std::cout << p.empty() << std::endl << std::endl;

    while (!p.empty()) {
        // Print the items in the structure
        std::cout << p.top() << std::endl;

        // After printing the item, pop it out
        p.pop();
    }
    return 0;
}
