# static和extern关键字-对函数的作用
##本小节知识点:
1. 【掌握】static 与 extern对函数的作用

---

##1.static 与 extern对函数的作用
- 内部函数:只能在本文件中访问的函数
- 外部函数:可以在本文件中以及其他的文件中访问的函数
- 默认情况下所有的函数都是外部函数

- static 作用
    + 声明一个内部函数
```
static int sum(int num1,int num2);
```
    + 定义一个内部函数
```
static int sum(int num1,int num2)
{
    return num1 + num2;
}
````

- extern作用
    + 声明一个外部函数
```
extern int sum(int num1,int num2);
```
    + 定义一个外部函数
```
extern int sum(int num1,int num2)
{
    return num1 + num2;
}
```
---

