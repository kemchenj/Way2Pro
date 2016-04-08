// 第1题：找出错误
#import <Foundation/Foundation.h>
@interface Person : NSObject
{
    int age;
    double height = 1.55; // 定义的同时
   // - (void)study; //应该写到大括号外面
}
// @end

@implementation Person
- (void)study
{
    NSLog(@"年龄为%d的人在学习", age);
}
@end

int main()
{
    Person p = [Person new];
    p->age = 10;
    p->height = 1.78f;
    [p study];
    return 0;
}

// 第2题：找出错误
#import <Foundation/Foundation.h>
@interface Test : NSObject
- (int)addNum1(int)num1 andNum2(int)num2;
- (double)pi:;
- (void)test();
@end

@implementation Test
- (int)addNum1(int)num1 andNum2(int)num2
{
    return num1 + num2;
}

- (double)pi:
{
    return 3.14;
}

- (void)test()
{
    
}
@end

int main()
{
    return 0;
}

// 第3题：找出错误
#import <Foundation/Foundation.h>
@interface Car : NSObject
{
@public
    int wheels;
}
@end
- (void)run;
- (void)test;

@implementation Car
- (void)test
{
    NSLog(@"测试一下车子：%i", wheels);
}

-(void) run
{
    [car ]
    NSLog(@"%i个轮子的车跑起来了", wheels);
}
@end

- (void)haha//方法的实现必须写在类的实现中
{
    NSLog(@"调用了haha");
}

int main()
{
    Car *c = [Car new];
    [c run];
    test();
    haha();
    return 0;
}

// 第4题：分析输出结果
#import <Foundation/Foundation.h>
@interface Person : NSObject
{
@public
    int age;
    double height;
}
- (void)print;
@end

void test1(int newAge, double newHeight);
void test2(Person *newP);
void test3(Person *newP);
void test4(Person *newP);

int main()
{
    Person *p = [Person new];
    p->age = 10;
    p->height = 1.5f;
    
    test1(p->age, p->height);
    [p print];
    
    test2(p);
    [p print];
    test3(p);
    [p print];
    test4(p);
    [p print];
    return 0;
}
@implementation Person
- (void)print
{
    NSLog(@"年龄=%d，身高=%f", age, height);
}
@end

void test1(int newAge, double newHeight)
{
    newAge = 10;
    newHeight = 1.6;
}

void test2(Person *newP)
{
    newP->age = 20;
    newP->height = 1.7;
}

void test3(Person *newP)
{
    Person *p2 = [Person new];
    p2->age = 40;
    p2->height = 1.8;
    newP = p2;
    
    newP->age = 30;
}

void test4(Person *newP)
{
    Person *p2 = newP;
    p2->age = 50;
    p2->height = 1.9;
    newP->age = 60;
}

// 第5题：编程
/*
 合理的设计一个”学生“类
 学生有* 姓名* 生日两个属性和说出自己姓名生日方法
 要求利用设计的学生类创建学生对象，并说出自己的姓名和年龄
 */