#include <string>
#include <math.h>

#include "stack.h"

namespace DATA_STRUCTURE {

class calculator {
    public:
        struct element {
            int flag;           // flag = 0 => number has the type of int, else double
            int num_int;
            double num_double;
        };
        enum compare{
            error,
            less,
            equal,
            greater
        };
    public:
        calculator() = default;
        calculator(std::string _expr){
            expr = _expr;
        }
        
        ~calculator() = default;

        std::string get_expr();
        struct element get_ans();
        bool legal();
    private:
        std::string expr = "1+2*(3-1+4)#";
        int expr_index = 0;
        stack<struct element> num;
        stack<char> op;

        struct element read_num();
        int priority_regular(char c);
        int priority(char c1, char c2);
        struct element operate(struct element element1, char c, struct element element2);
};

}
