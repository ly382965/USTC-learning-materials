# C++入门说明文档
## 引言
欢迎大家来到 C++ 的世界！作为有 C 语言基础的同学，你们已经具备了扎实的编程基础和逻辑思维能力。你们可能会担心，学习 C++ 是否会非常复杂，或者是否需要从头开始。事实上，C++ 是在 C 语言的基础上发展而来的，保留了 C 语言的许多特性，同时引入了面向对象编程等强大的新特性，使得编写复杂程序变得更加高效和灵活。

学习 C++ 的过程并不是一场彻底的革命，而更像是一场进化。你们会发现，许多 C 语言的知识和技能在 C++ 中依然适用。C++ 允许在 C 语言的基础上逐步采用其新特性，这意味着你们可以在现有的 C 语言知识基础上，逐步引入和掌握 C++ 的新概念。

在本文档中，我们将通过清晰的讲解和丰富的实例，帮助你们轻松过渡到 C++ 的编程环境。我们会逐步介绍面向对象编程、标准模板库（STL）等高级特性。每个新概念都会通过实际的代码示例来说明。

希望同学们在 C++ 的学习之旅中轻松愉快！

## OOP(Object-Oriented Programming)
在学习 C++ 之前，我们先来回顾一下 C 语言。在 C 语言中，程序员通过函数和数据结构来组织代码，这种过程式编程方法虽然强大，但在处理复杂系统时会显得力不从心。尤其在以下几个方面，C 语言的局限性显现得尤为突出：
- **复杂性管理**：随着软件系统变得越来越复杂，C语言在管理复杂性方面显得力不从心。面向过程的编程方式需要开发者手动管理数据和函数的关系，容易导致代码难以维护和扩展。
- **缺乏抽象机制**：C语言没有提供直接的抽象机制（如类和对象），无法有效地封装数据和行为。
```
PS: 数据封装是指将数据和操作数据的函数捆绑在一起，并隐藏内部实现细节，只对外提供接口。这样可以保护数据不被外部代码直接访问和修改，从而提高代码的安全性和可维护性。 
```
### 封装操作--出于安全性的考虑

举个关于模拟银行运作的代码的例子：
```C
#include <stdio.h>
#include <string.h>

// 定义一个结构体表示银行账户
typedef struct {
    char owner[50];
    double balance;
} BankAccount;

// 创建账户
void createAccount(BankAccount* account, const char* owner, double initialBalance) {
    strcpy(account->owner, owner);
    account->balance = initialBalance;
}

// 存款
void deposit(BankAccount* account, double amount) {
    account->balance += amount;
}

// 取款
void withdraw(BankAccount* account, double amount) {
    if (amount <= account->balance) {
        account->balance -= amount;
    } else {
        printf("Insufficient funds\n");
    }
}

// 打印账户信息
void printAccount(const BankAccount* account) {
    printf("Owner: %s\nBalance: %.2f\n", account->owner, account->balance);
}

int main() {
    BankAccount account;
    createAccount(&account, "Alice", 1000.0);
    deposit(&account, 200.0);
    withdraw(&account, 150.0);
    printAccount(&account);

    // 直接访问和修改结构体成员（不安全）
    strcpy(account.owner, "Bob");
    account.balance = 500.0;
    printAccount(&account);  // 修改后的账户信息
    return 0;
}
```
可以看到虽然关于账户管理的函数已经规定了传入的参数是账户结构体类型了，但是实际上结构体的数据成员(代码中的`owner`、`balance`)是可以在`main`函数里**随意进行访问和修改**的(意味着即使其它与账户管理无关的过程也可以进行修改结构体的成员变量)，这破坏了数据的封装性，可能会对结构体的安全产生威胁。
相比之下，C++通过类和对象的方式实现了真正的数据封装：
```C++
#include <iostream>
#include <string>

class BankAccount {
private:
    std::string owner;
    double balance;

public:
    // 构造函数
    BankAccount(const std::string& owner, double initialBalance)
        : owner(owner), balance(initialBalance) {}

    // 存款
    void deposit(double amount) {
        balance += amount;
    }

    // 取款
    void withdraw(double amount) {
        if (amount <= balance) {
            balance -= amount;
        } else {
            std::cout << "Insufficient funds\n";
        }
    }

    // 打印账户信息
    void printAccount() const {
        std::cout << "Owner: " << owner << "\nBalance: " << balance << "\n";
    }
};

int main() {
    BankAccount account("Alice", 1000.0);
    account.deposit(200.0);
    account.withdraw(150.0);
    account.printAccount();

    // 试图直接访问和修改私有成员（编译错误）
    // account.owner = "Bob";  // Error: 'std::string BankAccount::owner' is private within this context
    // account.balance = 500.0;  // Error: 'double BankAccount::balance' is private within this context
    return 0;
}
```
与 C 语言相比，C++ 通过类和对象将数据和操作封装在一起，提供了清晰的接口。同时它使用访问控制符（如private）隐藏数据，只有通过公共成员函数才能访问和修改数据，提高了代码的安全性和可维护性，减少了错误的可能性。

### 继承--提高代码的重用性
在软件开发中，**代码重用**是非常重要的。重复的代码不仅增加了维护的难度，还容易引入错误。通过继承，可以重用现有类的属性和方法，而不需要重复编写相同的代码。
```
PS: 就好比你计算加法乘法混合式 3 * 2 * 3 + 3 * 2 * 4 * 2 ，
代码重用就是相当于 3 * 2 * (3 + 4 * 2)， 前者使用的乘法次数多，后者使用的乘法次数少。
代码重用就好比是提取公因式的过程，公共部分一并处理，特殊部分分别处理。
```
举个例子，现在我们有一个类别：人，他在C语言的实现为：
```C
// 人的结构体
typedef struct Person
{
    int age;
    char name[50];
}Person;
```
当然，人有各种各样的社会职责分类，拿学生和老师为例，学生有额外的等级属性，老师有额外的教学科目属性，同理的：
```C
// 学生结构体
typedef struct Student
{
    int age;
    char name[50];
    char grade; // 新增的等级属性，可以取 A, B, C, D
}Student;

// 老师结构体
typedef struct Teacher
{
    int age;
    char name[50];
    char teaching_subject[20]; // 新增的教学科目属性
}Teacher;
```
可以看到在定义这学生和老师这两个结构体时，虽然这两个结构体都包含了各自的基本信息，但是有没有发现中间有相当一部分属性是重叠的？更别提需要重复写一些对这些属性进行类似更改的函数：
```C
void modifyStuAge(Student *student)
{
    ...
}

void modifyTeaAge(Teacher *teacher)
{
    ...
}
```
显然这些公共的部分都是可以只进行一次定义的，但是由于不同的数据类型需要传入的参数不同，需要对这两个结构体单独实现一遍这个函数。
如果使用 C++ 对这些类进行处理，处理方案是这样的：
- 首先先定义基类：人，存储大类里公共的属性，包括名字和年龄
```C++
// 定义基类：人
class Person {
protected:
    std::string name;
    int age;

public:
    Person(const std::string& name, int age) : name(name), age(age) {}

    virtual void print() const {
        std::cout << "Name: " << name << ", Age: " << age << "\n";
    }

    virtual ~Person() = default;
};
```
这里引出了一些在 C 语言中没有的东西，如 `protected`、`public`、`Person()`、`virtual` 以及 `~Person()`，下面进行逐一解释：
#### 一、`protected`、`public`、`private`
在C++中，private、protected和public是**访问控制修饰符**，用于控制类成员（属性和方法）的**访问权限**。理解它们对于设计和实现类的继承关系非常重要。下面是它们的详细解释和比较：
##### 1. `public`：
- 访问权限：公共成员可以在类的内部和外部访问。
- 用途：用于定义类的接口，允许外部代码访问这些成员。

##### 2. `private`：
- 访问权限：私有成员只能在类的内部访问，不能被类的外部代码直接访问，包括派生类。
- 用途：用于保护类的内部实现细节，不希望外部代码直接访问或修改这些成员。
比如这里的 `Person` 类不希望程序直接通过实例化的对象访问成员的方式获得 `age`，则可以设置为：
```C++
class Person {
    private:
        int age;

    public: 
        std::string name;
}
```
这时候如果进行这样的访问：
```C++
Person Bob = new Person("Bob", "15");
int Bob_age = Bob.age;
```
这种访问是不被允许，并且会在编译阶段报出错误，原因是 `age` 成员是私有成员变量，不能直接被访问，因此需要设置一些额外的函数来获取这个属性值，如在定义变量的访问方法时，可以写成：
```C++
class Person {
    private:
        int age;

    public: 
        std::string name;

        int getAge()    // 获取私有属性age的函数
        {
            return age;
        }

        void setAge(int target_age) // 设置私有属性age的函数
        {
            age = target_age;
        }
}
```
即使不能直接访问 `age` 这个成员属性，也可以通过定义一些公开的函数来对这个属性值进行相关的获取和设置操作。

##### 3. `protected`：
- 访问权限：受保护成员可以在类的内部和派生类中访问，但不能被类的外部代码直接访问。
- 用途：允许派生类访问和使用基类的部分成员，但仍然保护这些成员不被外部代码直接访问。

仍然以 `Person` 这个大类作为例子， 假设 `Person` 下的成员属性 `age`不希望被外界访问到，但是另一个 `Person` 下衍生的类 `Student` 它也想能够自由地访问继承自 `Person` 的公共属性 `age`，这个时候就可以使用 `protected` 关键字对其进行限制：
```C++
class Person {
    protected:
        int age;
    
    private:
        bool gender;

    public:
        std::string name;
}

class Student: public Person {
    private:
        int grade;
    
    // protected 的成员 age 也可以进行访问
    public:
        void printStuAge()
        {
            std::cout << "Student named " << name << "'s age is " << age << std::endl;  // 合法函数
        }
    // 但是 private 的成员 gender 在 Student 里不能访问
        // void printStuGender()
        // {
        //     std::cout << "Student named " << name << "'s gender is " << gender << std::endl;
        // }
        // 该函数不能通过编译
}
```
#### 二、构造函数和析构函数
再次观察以下代码：
```C++
// 定义基类：人
class Person {
protected:
    std::string name;
    int age;

public:
    Person(const std::string& name, int age) : name(name), age(age) {}

    virtual void print() const {
        std::cout << "Name: " << name << ", Age: " << age << "\n";
    }

    virtual ~Person() = default;
};
```
有没有发现 `Person()` 这个函数很特殊？它不像普通的函数一样有返回值类型，但是又有参数。这个函数叫做**构造函数**，它的定义如下：

**定义**: 构造函数是一个特殊的成员函数，它在创建对象时被自动调用，用于初始化对象。构造函数的名称与类名相同，并且没有返回类型。
在这段代码里，`Person`类的构造函数为：
```C++
Person(const std::string& name, int age) : name(name), age(age) {}
```
这个构造函数接受两个参数：`const std::string& name` 和 `int age`，分别用来初始化成员变量 `name` 和 `age` 。
它的使用方式是当你创建一个Person对象时，构造函数会被自动调用。例如：
```C++
Person person("Alice", 30);
```
它会创建一个名为person的Person对象，并将name初始化为"Alice"，age初始化为30。

另外一个看起来有点奇怪的函数：
```C++
virtual ~Person() = default;
```
前面的`~`代表它是**析构函数**。析构函数的定义如下：

**定义**：析构函数是一个特殊的成员函数，它在对象**被销毁时**自动调用，用于清理和释放资源。析构函数的名称是类名前加上~符号，并且没有返回类型，也没有参数。
当Person对象的生命周期结束时，析构函数会被自动调用。例如，当person对象在其作用域结束时或显式删除时，析构函数会执行：
```C++
{
    Person person("Alice", 30);
} // 作用域结束，person对象被销毁，析构函数被调用

Person* personPtr = new Person("Bob", 40);
delete personPtr; // 显式删除对象，析构函数被调用
```
**默认实现**： `= default` 表示使用编译器生成的默认析构函数。对于简单的类，如果没有特殊的资源管理需求（如动态内存分配），默认的析构函数通常已经足够。

#### 三、`virtual`
`virtual`关键字用于指示某个成员函数是“虚函数”。虚函数允许派生类 **重写(override)** 它们，从而实现 **多态(polymorphism)** 。在基类中将成员函数声明为虚函数，确保了在运行时通过基类指针或引用调用派生类的实现。

拿第二次实验的部分代码举例， `list.h` 有如下内容：
```C++
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
```
这里定义了几个**没有进行实现**的函数`pop()`、`top()`、`push()`等。这些函数没有具体实现，必须由派生类提供具体的实现，因此需要加上`virtual`关键字。而在`list`类的继承类 `stack`(位于 `stack.h` 里) 和 `queue`(位于 `queue.h` 里)：
```C++
class queue : public list<data_base> {
    public:
        queue() = default;
        ~queue() = default;

        bool empty() override {
            // TODO
            return true;
        }
        void pop() override {
            // TODO
        }
        data_base top() override {
            // TODO
            data_base tmp;
            return tmp;
        }
        void push(data_base push_data) override {
            // TODO
        }
        void clear() override {
            // TODO
        }
    private:
        int top_index = 0;
        int tail_index = 0;
        data_base list_data[MAX_LINK_LIST_NUM];
};
```
这里没有了`virtual`关键字， 多了个`override`，明确地表示这是一个重写（override）操作，确保函数签名与基类中的虚函数匹配。

### 总结
面向对象编程涉及到两个非常重要的概念：封装和继承。
- **封装（Encapsulation）**
    - 概念：封装是将数据和操作这些数据的方法绑定在一起，形成一个类，并隐藏类的内部实现细节。通过封装，可以控制对类成员的访问，提高代码的安全性和可维护性。

    - 特性：
        1. 访问控制：
            - Public：公有成员可以被类的外部代码访问。
            - Protected：受保护成员只能被类本身及其子类访问。
            - Private：私有成员只能被类本身访问，不能被类的外部或子类直接访问。
        2. 接口与实现分离：通过公开类的接口（公有方法），隐藏实现细节（私有成员变量和方法），用户只能通过公开的接口与类交互，而不知道内部的实现细节。
        3. 数据保护：通过访问控制，可以防止数据被不恰当地修改，从而保护对象的状态。

- **继承（Inheritance）**
    - 概念：继承是一种创建新类的机制，通过从现有类（基类）派生出新类（派生类），新类不仅继承了基类的成员和方法，还可以添加新的成员和方法，甚至可以重载基类的方法。

    - 特性：
        1. 代码重用：通过继承，可以重用基类的代码，减少代码重复，提高开发效率。
        2. 层次结构：通过继承，可以构建类的层次结构。例如，Dog 类可以继承自 Animal 类，表示狗是一种动物。
        3. 多态性：继承是实现多态性的基础，通过基类指针或引用可以调用派生类的重载方法。
        4. 访问控制：继承的访问权限可以是 public、protected 或 private，控制基类成员在派生类中的可见性和访问权限。

## 标准模板库(STL,Standard Template Library)
除了上面提到的OOP，C++在C语言的基础上添加了很多有用的库协助程序员更高效地进行开发，现在就部分初学者可能用到的数据结构及算法进行详细讲解：
### 一、容器
容器是用于存储和管理数据的类模板，可以简单地理解为 C++ 为我们实现了常用的数据结构，直接使用这些数据结构的接口即可。STL 提供了多种容器，每种容器都有其特定的用途和特点。
#### 向量（Vector）
`std::vector` 是一种**动态数组**，可以根据需要自动调整大小。它支持快速随机访问，但在中间插入或删除元素的效率较低。
其常用的函数如下：
- `vector`的声明：`vector<type> 变量名;` 声明一个类型为`type`的`vector`，`type`可以进行嵌套，如`vector<vector<int>>`等。
- 访问操作：
    - `front()`: 返回第一个元素。
    - `back()`: 返回最后一个元素。
    - `at(pos)`: 返回元素`pos`处的位置，并进行越界检查。`pos`是`size_type`，通常输入整型即可。
- 迭代器类：
    - `begin()`: 返回指向第一个元素的迭代器。
    - `end()`: 返回指向末尾元素后一位置的迭代器。
- 容量信息：
    - `empty()`: 检查`vector`是否为空。
    - `size()`: 返回`vector`当前元素的数量。
- 修改操作：
    - `push_back(element)`: 在`vector`末尾添加`element`这个元素。
    - `pop_back()`: 删除`vector`末尾的元素。
    - `insert(pos, element)`: 在`vector`中的`pos`位置插入`element`这个元素。注意`pos`的表示通常是 **迭代器+偏移量**，迭代器的获取通常是由 `begin()` 和 `end()` 这两个函数获得。
    - `erase(pos)`: 删除`vector`中`pos`位置的元素，`pos`表示同`insert`。
    - `clear()`: 清除`vector`的所有元素。

具体使用的代码实例如下：
```C++
#include <iostream>
#include <vector>

int main() {
    // 创建一个空的 vector
    std::vector<int> vec;   // <type>可以自己修改，可以嵌套vector<vector<type>>

    // 在容器末尾添加元素
    vec.push_back(10);
    vec.push_back(20);
    vec.push_back(30);

    // 访问元素
    std::cout << "Element at index 1: " << vec[1] << std::endl; // 不进行越界检查
    std::cout << "First element: " << vec.front() << std::endl;
    std::cout << "Last element: " << vec.back() << std::endl;

    // 使用迭代器遍历
    std::cout << "Elements in vector: ";
    for (std::vector<int>::iterator it = vec.begin(); it != vec.end(); ++it) {
        std::cout << *it << " ";
    }
    std::cout << std::endl;

    // 插入和删除元素
    vec.insert(vec.begin() + 1, 15); // 在索引 1 位置插入元素 15
    vec.erase(vec.begin() + 2); // 删除索引 2 位置的元素

    // 打印修改后的 vector
    std::cout << "Modified vector: ";
    for (const int& val : vec) {
        std::cout << val << " ";
    }
    std::cout << std::endl;

    // 改变 vector 的大小
    vec.resize(2);
    std::cout << "Resized vector: ";
    for (const int& val : vec) {
        std::cout << val << " ";
    }
    std::cout << std::endl;

    // 清除所有元素
    vec.clear();
    std::cout << "Vector size after clear: " << vec.size() << std::endl;

    return 0;
}
```
#### 列表(List)
std::list 是一种双向链表，允许在任何位置进行高效的插入和删除操作，但随机访问性能较差。

常用的函数如下：
- list的声明：`list<type> 变量名;`声明一个类型为 type 的 list。
- 访问操作：
    - `front()`: 返回第一个元素。
    - `back()`: 返回最后一个元素。
- 迭代器类：
    - `begin()`: 返回指向第一个元素的迭代器。
    - `end()`: 返回指向末尾元素后一位置的迭代器。
- 容量信息：
    - `empty()`: 检查 list 是否为空。
    - `size()`: 返回 list 当前元素的数量。
- 修改操作：
    - `push_front(element)`: 在 list 前端添加 element 这个元素。
    - `push_back(element)`: 在 list 末尾添加 element 这个元素。
    - `pop_front()`: 删除 list 前端的元素。
    - `pop_back()`: 删除 list 末尾的元素。
    - `insert(pos, element)`: 在 list 中的 pos 位置插入 element 这个元素。
    - `erase(pos)`: 删除 list 中 pos 位置的元素。
    - `clear()`: 清除 list 的所有元素。

使用`list`的代码实例如下：
```C++
#include <iostream>
#include <list>

int main() {
    // 创建一个空的 list
    std::list<int> lst;

    // 在容器末尾添加元素
    lst.push_back(10);
    lst.push_back(20);
    lst.push_back(30);

    // 在容器前端添加元素
    lst.push_front(5);

    // 访问元素
    std::cout << "First element: " << lst.front() << std::endl;
    std::cout << "Last element: " << lst.back() << std::endl;

    // 使用迭代器遍历
    std::cout << "Elements in list: ";
    for (std::list<int>::iterator it = lst.begin(); it != lst.end(); ++it) {
        std::cout << *it << " ";
    }
    std::cout << std::endl;

    // 插入和删除元素
    std::list<int>::iterator it = lst.begin();
    ++it; // 移动迭代器到第二个元素
    lst.insert(it, 15); // 在第二个元素位置插入 15
    it = lst.begin();
    ++it;
    lst.erase(it); // 删除第二个元素

    // 打印修改后的 list
    std::cout << "Modified list: ";
    for (const int& val : lst) {
        std::cout << val << " ";
    }
    std::cout << std::endl;

    // 清除所有元素
    lst.clear();
    std::cout << "List size after clear: " << lst.size() << std::endl;

    return 0;
}
```
#### 映射(Map)
`std::map` 是一种关联容器，存储键值对，以下是一些常用的接口函数：

- `map`的声明：`std::map<int, std::string> mp;` 声明了一个键类型为 `int`，值类型为 `string` 的 `map`，初始状态该容器内部为空。
- 访问操作：
    - `mapped_type& at(const key_type& key)`：访问指定键对应的元素，并进行越界检查。
- 迭代器类：
    - `iterator begin()`：返回指向第一个元素的迭代器。
    - `iterator end()`：返回指向末尾元素后一位置的迭代器。
- 容量信息：
    - `bool empty() const`：检查容器是否为空。
    - `size_type size() const`：返回容器中元素的数量。
- 修改操作：
    - `void clear()`：清除所有元素。
    - `iterator insert(const value_type& value)`：插入元素 value。
    - `iterator erase(iterator pos)`：删除 pos 位置的元素。
    - `size_type erase(const key_type& key)`：删除指定键对应的元素。
- 查找：
    - `iterator find(const key_type& key)`：查找指定键对应的元素

#### 栈(Stack)
`std::stack` 是一种后进先出（LIFO）数据结构，适合需要按相反顺序处理数据的场景。

常用的函数如下：
- stack的声明：`stack<type> 变量名`; 声明一个类型为 type 的 stack。
- 访问操作：
    - `top()`: 返回栈顶元素。
- 容量信息：
    - `empty()`: 检查 stack 是否为空。
    - `size()`: 返回 stack 当前元素的数量。
- 修改操作：
    - `push(element)`: 向栈顶添加 element 元素。
    - `pop()`: 删除栈顶元素。
使用的示例代码如下：
```C++
#include <iostream>
#include <stack>

int main() {
    std::stack<int> stk;

    // 压入元素
    stk.push(10);
    stk.push(20);
    stk.push(30);

    // 访问栈顶元素
    std::cout << "Top element: " << stk.top() << std::endl;

    // 弹出元素
    stk.pop();
    std::cout << "Top element after pop: " << stk.top() << std::endl;

    return 0;
}
```
#### 队列(Queue)
`std::queue` 是一种先进先出（FIFO）数据结构，适合按顺序处理数据的场景。

常用的函数如下：
- queue的声明：`queue<type> 变量名;` 声明一个类型为 type 的 queue。
- 访问操作：
    - `front()`: 返回队列前端元素。
    - `back()`: 返回队列末尾元素。
- 容量信息：
    - `empty()`: 检查 queue 是否为空。
    - `size()`: 返回 queue 当前元素的数量。
- 修改操作：
    - `push(element)`: 向队列末尾添加 element 元素。
    - `pop()`: 删除队列前端元素。
使用的示例代码如下：
```C++
#include <iostream>
#include <queue>

int main() {
    std::queue<int> q;

    // 压入元素
    q.push(10);
    q.push(20);
    q.push(30);

    // 访问前端和末尾元素
    std::cout << "Front element: " << q.front() << std::endl;
    std::cout << "Back element: " << q.back() << std::endl;

    // 弹出元素
    q.pop();
    std::cout << "Front element after pop: " << q.front() << std::endl;

    return 0;
}
```

#### 无序映射(Unordered Map)
`std::unordered_map` 是一种基于哈希表实现的关联容器，提供键值对存储，键值对无序。

常用的函数如下：
- unordered_map的声明：`unordered_map<key_type, value_type> 变量名;` 声明一个键类型为 key_type、值类型为 value_type 的 unordered_map。
- 访问操作：
    - `operator[]`: 根据键访问对应的值，如果键不存在会自动插入。
    - `at(key)`: 返回键 key 对应的值，并进行越界检查。
- 迭代器类：
    - `begin()`: 返回指向第一个元素的迭代器。
    - `end()`: 返回指向末尾元素后一位置的迭代器。
- 容量信息：
    - `empty()`: 检查 unordered_map 是否为空。
    - `size()`: 返回 unordered_map 当前元素的数量。
- 修改操作：
    - `insert(pair)`: 插入一个键值对 pair。
    - `erase(key)`: 删除键为 key 的元素。
    - `clear()`: 清除 unordered_map 的所有元素。
### 二、迭代器
迭代器是C++标准模板库（STL）中的一个核心概念，用于访问和操作容器中的元素。可以将迭代器类比为指针，但它们比指针更灵活和安全。

**迭代器的作用**：
- 迭代器用于遍历容器中的元素。
- 迭代器提供了一种统一的方式来访问不同容器（如vector、list、map等）中的元素。

**迭代器的类型**：
- 输入迭代器（Input Iterator）：只能读取元素，单向遍历。
```C++
#include <iostream>
#include <iterator>
#include <vector>

int main() {
    std::vector<int> vec;
    std::cout << "Enter integers (Ctrl+D to end): ";

    // 使用输入流迭代器从标准输入读取数据
    std::istream_iterator<int> inputIter(std::cin);
    std::istream_iterator<int> endIter;

    while (inputIter != endIter) {
        vec.push_back(*inputIter);
        ++inputIter;
    }

    // 打印读取的数据
    std::cout << "You entered: ";
    for (int val : vec) {
        std::cout << val << " ";
    }
    std::cout << std::endl;

    return 0;
}
```
- 输出迭代器（Output Iterator）：只能写入元素，单向遍历。
```C++
#include <iostream>
#include <iterator>
#include <vector>

int main() {
    std::vector<int> vec = {1, 2, 3, 4, 5};

    std::cout << "Outputting vector elements: ";
    // 使用输出流迭代器将数据写入标准输出
    std::ostream_iterator<int> outputIter(std::cout, " ");
    for (int val : vec) {
        *outputIter = val;
    }
    std::cout << std::endl;

    return 0;
}

```
- 前向迭代器（Forward Iterator）：既能读取也能写入，单向遍历。
```C++
#include <iostream>
#include <forward_list>

int main() {
    std::forward_list<int> flist = {10, 20, 30, 40, 50};

    std::cout << "Elements in forward_list: ";
    for (std::forward_list<int>::iterator it = flist.begin(); it != flist.end(); ++it) {
        std::cout << *it << " ";
    }
    std::cout << std::endl;

    return 0;
}
```
- 双向迭代器（Bidirectional Iterator）：既能读取也能写入，可以双向遍历。
```C++
#include <iostream>
#include <list>

int main() {
    std::list<int> lst = {10, 20, 30, 40, 50};

    std::cout << "Elements in list: ";
    for (std::list<int>::iterator it = lst.begin(); it != lst.end(); ++it) {
        std::cout << *it << " ";
    }
    std::cout << std::endl;

    // 反向遍历
    std::cout << "Elements in reverse: ";
    for (std::list<int>::reverse_iterator rit = lst.rbegin(); rit != lst.rend(); ++rit) {
        std::cout << *rit << " ";
    }
    std::cout << std::endl;

    return 0;
}
```
- 随机访问迭代器（Random Access Iterator）：支持随机访问，功能最强大，如指针。
```C++
#include <iostream>
#include <vector>

int main() {
    std::vector<int> vec = {10, 20, 30, 40, 50};

    // 使用随机访问迭代器访问元素
    std::cout << "Elements in vector: ";
    for (std::vector<int>::iterator it = vec.begin(); it != vec.end(); ++it) {
        std::cout << *it << " ";
    }
    std::cout << std::endl;

    // 随机访问元素
    std::cout << "Third element: " << vec[2] << std::endl;

    return 0;
}
```

### 三、算法
除了容器和迭代器之外，C++标准模板库（STL）还提供了丰富的算法，这些算法可以直接应用于容器和迭代器上。STL算法使得编写高效、简洁的代码变得更加容易。以下是初学者应该了解的一些常用算法及其基本用法：
#### 算法分类
STL算法大致可以分为以下几类：
- 非修改序列操作：不改变元素的内容。
- 修改序列操作：改变元素的内容。
- 排序和相关操作：对元素进行排序、分区等操作。
- 集合操作：在有序集合上进行的操作。
#### 常用算法
1. `for_each`：遍历容器中的每一个元素并对其应用一个函数。
```C++
#include <iostream>
#include <vector>
#include <algorithm>

void printElement(int n) {
    std::cout << n << " ";
}

int main() {
    std::vector<int> vec = {1, 2, 3, 4, 5};
    std::for_each(vec.begin(), vec.end(), printElement);
    std::cout << std::endl;
    return 0;
}
```
2. `find`：在容器中查找第一个等于某个值的元素。
```C++
#include <iostream>
#include <vector>
#include <algorithm>

int main() {
    std::vector<int> vec = {1, 2, 3, 4, 5};
    auto it = std::find(vec.begin(), vec.end(), 3);
    if (it != vec.end()) {
        std::cout << "Element found at position: " << std::distance(vec.begin(), it) << std::endl;
    } else {
        std::cout << "Element not found." << std::endl;
    }
    return 0;
}
```
3. `sort`：对容器中的元素进行排序。
```C++
#include <iostream>
#include <vector>
#include <algorithm>

int main() {
    std::vector<int> vec = {5, 3, 1, 4, 2};
    std::sort(vec.begin(), vec.end());
    for (int n : vec) {
        std::cout << n << " ";
    }
    std::cout << std::endl;
    return 0;
}
```
4. `copy`：将一个容器中的元素复制到另一个容器中。
```C++
#include <iostream>
#include <vector>
#include <algorithm>

int main() {
    std::vector<int> vec1 = {1, 2, 3, 4, 5};
    std::vector<int> vec2(vec1.size());
    std::copy(vec1.begin(), vec1.end(), vec2.begin());
    for (int n : vec2) {
        std::cout << n << " ";
    }
    std::cout << std::endl;
    return 0;
}
```
5. `reverse`：反转容器中的元素顺序。
```C++
#include <iostream>
#include <vector>
#include <algorithm>

int main() {
    std::vector<int> vec = {1, 2, 3, 4, 5};
    std::reverse(vec.begin(), vec.end());
    for (int n : vec) {
        std::cout << n << " ";
    }
    std::cout << std::endl;
    return 0;
}
```
6. `count`：计算容器中某个值出现的次数。
```C++
#include <iostream>
#include <vector>
#include <algorithm>

int main() {
    std::vector<int> vec = {1, 2, 3, 1, 4, 1, 5};
    int count = std::count(vec.begin(), vec.end(), 1);
    std::cout << "Number of 1s: " << count << std::endl;
    return 0;
}
```
## 结尾语
以上的全部并不是C++的整个完整的内容，但是这些内容是初学者及非专业人士用的最多的部分。在阅读以上内容时，也无需强行记住以上的用法，只是留一个概念上的印象即可，用到的时候在查询对应的用法就好。希望能够帮助到各位同学入门学习这一门面向对象编程的语言！