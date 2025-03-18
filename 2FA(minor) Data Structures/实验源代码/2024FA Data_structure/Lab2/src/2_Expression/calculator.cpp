#include "calculator.h"
#include <cmath>
namespace DATA_STRUCTURE {

std::string calculator::get_expr() {
    return expr;
}

bool calculator::legal() {
    int bracket = 0;
    DATA_STRUCTURE::stack<char> brackets;  // 存储括号
    brackets.clear();
    bool last_op = false;  // 存储上一个字符
    bool last_num = false;    
    for (int i = 0; expr[i]!='\0'; i++) 
    {
        char ch = expr[i];
        if (ch == '(') 
        {
            brackets.push(ch);
            last_op = false;
        } 
        else if (ch == ')') 
        {
            if (brackets.empty() || brackets.top() != '(') {
                return false;  // 括号不匹配
            }
            brackets.pop();  // 括号匹配
            last_op = false;
        } 
        else if (isdigit(ch)) 
        {
            last_num = true;
            last_op = false;
        } 
        else if (ch == '+' || ch == '-' || ch == '*' || ch == '/' || ch == '^') 
        {
            if (!last_num && (i == 0 || expr[i-1] == '(' || expr[i-1] == '+' || expr[i-1] == '-' || expr[i-1] == '*' || expr[i-1] == '/'|| expr[i-1] == '^')) {
                return false;  //连续两个运算符不合法
            }
            last_op = true;
        }
        else if (ch == '.' || ch == '#')
        {
            last_num = true;
            last_op = false;
        }
        else
        {
            return false;
        }
    }

    //结尾不能为运算符，且括号完全匹配
    return brackets.empty() && !last_op;
}

int calculator::priority_regular(char c) {
    // TODO
    switch (c)
    {
        case '+':return 1;
        case '-':return 1;
        case '*':return 2;
        case '/':return 2;
        case '^':return 3;
        case '(':return 0;
        case ')':return 4;
        case '#':return -1;
        default: return -2;
    }
}

int calculator::priority(char c1, char c2) {
    // TODO
    int p1=priority_regular(c1);
    int p2=priority_regular(c2);
    if((p1==0 && p2==4)||(p1==-1 && p2==-1))
    {
        return equal;
    }
    else if(p1==4 && p2==0)
    {
        return error;
    }
    else if((p1==4 || p2==4))
    {
        return greater;
    }
    else if((p1<p2)||(p1==0 || p2==0))
    {
        return less;
    }
    else
    {
        return greater;
    }
}

struct calculator::element calculator::read_num() {
    // TODO
    std::string num_str="\0";
    int i=0;
    bool is_float=false;
    while ((isdigit(expr[expr_index]) || expr[expr_index] == '.' )) 
    {
        num_str[i] = expr[expr_index];
        if(expr[expr_index] == '.')
        {
            is_float=true;
        }
        i++;
        expr_index++;
    }
    num_str[i]='\0';
    calculator::element answer;
    if(is_float)
    {
        answer.flag = 1;
        answer.num_double = std::stod(num_str);
        answer.num_int = 0;
    }
    else
    {
        answer.flag = 0;
        answer.num_double = 0;
        answer.num_int = std::stoi(num_str);
    }
    return answer;
}

struct calculator::element calculator::operate(struct calculator::element element1, char c, struct calculator::element element2) {
    // TODO
    calculator::element answer;
    switch (c)
    {
        case '+':
            if(element1.flag == 0 && element2.flag == 0)
            {
                answer.flag = 0;
                answer.num_double = 0;
                answer.num_int = element1.num_int + element2.num_int;
            }
            else if(element1.flag == 1 && element2.flag == 0)
            {
                answer.flag = 1;
                answer.num_double = element1.num_double + (double)element2.num_int;
                answer.num_int = 0;
            }
            else if(element1.flag == 0 && element2.flag == 1)
            {
                answer.flag = 1;
                answer.num_double = (double)element1.num_int + element2.num_double;
                answer.num_int = 0;
            }
            else
            {
                answer.flag = 1;
                answer.num_double = element1.num_double + element2.num_double;
                answer.num_int = 0;
            }
            break;
        case '-':
            if(element1.flag == 0 && element2.flag == 0)
            {
                answer.flag = 0;
                answer.num_double = 0;
                answer.num_int = element1.num_int - element2.num_int;
            }
            else if(element1.flag == 1 && element2.flag == 0)
            {
                answer.flag = 1;
                answer.num_double = element1.num_double - (double)element2.num_int;
                answer.num_int = 0;
            }
            else if(element1.flag == 0 && element2.flag == 1)
            {
                answer.flag = 1;
                answer.num_double = (double)element1.num_int - element2.num_double;
                answer.num_int = 0;
            }
            else
            {
                answer.flag = 1;
                answer.num_double = element1.num_double - element2.num_double;
                answer.num_int = 0;
            }
            break;
        case '*':
            if(element1.flag == 0 && element2.flag == 0)
            {
                answer.flag = 0;
                answer.num_double = 0;
                answer.num_int = element1.num_int * element2.num_int;
            }
            else if(element1.flag == 1 && element2.flag == 0)
            {
                answer.flag = 1;
                answer.num_double = element1.num_double * (double)element2.num_int;
                answer.num_int = 0;
            }
            else if(element1.flag == 0 && element2.flag == 1)
            {
                answer.flag = 1;
                answer.num_double = (double)element1.num_int * element2.num_double;
                answer.num_int = 0;
            }
            else
            {
                answer.flag = 1;
                answer.num_double = element1.num_double * element2.num_double;
                answer.num_int = 0;
            }
            break;
        case '/':
            if(element1.flag == 0 && element2.flag == 0)
            {
                answer.flag = 0;
                answer.num_double = 0;
                answer.num_int = element1.num_int / element2.num_int;
            }
            else if(element1.flag == 1 && element2.flag == 0)
            {
                answer.flag = 1;
                answer.num_double = element1.num_double / (double)element2.num_int;
                answer.num_int = 0;
            }
            else if(element1.flag == 0 && element2.flag == 1)
            {
                answer.flag = 1;
                answer.num_double = (double)element1.num_int / element2.num_double;
                answer.num_int = 0;
            }
            else
            {
                answer.flag = 1;
                answer.num_double = element1.num_double / element2.num_double;
                answer.num_int = 0;
            }
            break;
        case '^':
            if(element1.flag == 0 && element2.flag == 0)
            {
                answer.flag = 0;
                answer.num_double = 0;
                if(element2.num_int == 0)
                {
                    answer.num_int = 1;
                }
                else
                {
                    answer.num_int = pow(element1.num_int,element2.num_int);
                }
            }
            else if(element1.flag == 1 && element2.flag == 0)
            {
                answer.flag = 1;
                answer.num_double = pow(element1.num_double,(double)element2.num_int);
                answer.num_int = 0;
            }
            else if(element1.flag == 0 && element2.flag == 1)
            {
                answer.flag = 1;
                answer.num_double = pow((double)element1.num_int , element2.num_double);
                answer.num_int = 0;
            }
            else
            {
                answer.flag = 1;
                answer.num_double = pow(element1.num_double , element2.num_double);
                answer.num_int = 0;
            }
            break;
        default:
            break;
    }
    return answer;
}

struct calculator::element calculator::get_ans() {
    // TODO
    DATA_STRUCTURE::stack<calculator::element> OPND;
    DATA_STRUCTURE::stack<char> OPTR;
    OPND.clear();
    OPTR.clear();
    OPTR.push('#');
    char ch=expr[expr_index];
    while (ch != '#' || OPTR.top() != '#' )
    {
        if(priority_regular(ch) == -2 && ch != '\0')
        {
            calculator::element a;
            a = read_num();
            OPND.push(a);
            ch=expr[expr_index];
        }
        else
        {
            switch (priority(OPTR.top(),ch))
            {
            case less:
                OPTR.push(ch);
                expr_index++;
                ch=expr[expr_index];
                break;
            case greater:
                char theta;
                calculator::element a;
                calculator::element b;
                theta=OPTR.top();OPTR.pop();
                b=OPND.top();OPND.pop();
                a=OPND.top();OPND.pop();
                OPND.push(operate(a,theta,b));
                break;
            case equal:
                char x;
                x=OPTR.top();OPTR.pop();
                expr_index++;
                ch=expr[expr_index];
                break;
            default:
                exit(-1);
                break;
            }
        }
    }

    return OPND.top();
}

}