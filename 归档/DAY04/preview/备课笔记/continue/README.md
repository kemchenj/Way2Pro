# continue关键字
##本小节知识点:
1. 【了解】continue关键字

---

##1.continue关键字
- continue语句的作用是跳过循环体中剩余的语句而继续下一次

- 使用场合:
    + 循环结构

![](http://7xj0kx.com1.z0.glb.clouddn.com/continue.png)

- 练习: 把100~200之间的不能被3整除的数输出
```
for(int i = 100; i<= 200; i++)
{
    if(i %3 == 0) continue;
    printf("i = %d", i);
}
```
