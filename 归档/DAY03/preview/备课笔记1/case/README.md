# switch-case语句穿透问题
##本小节知识点:
1. 【掌握】case语句的穿透问题

##1.case的穿透问题
- switch里面的case只要匹配一次其它的都失效，包括default. 正是因为switch的这个特性, 所以可能导致程序出现逻辑错误

- 为了避免上述情况,C语言还􏰀供了一种break语句,专用于跳出switch语句,break 语句只 有关键字break,没有参数。在后面还将详细介绍。修改
    + 在每一case语句之后增加 break 语句, 使每一次执行之后均可跳出switch语句,从而避免输出不应有的结果
    + 有时候也可用巧妙的利用case的穿透问题来简化代码

- 示例
```
    int num;
    printf("输入一个1-7之间的数: ");
    scanf("%d",&num);
    switch (num){
        case 1:
            printf("玉米炒葡萄\n");
        //    break;
        case 2:
            printf("月饼炒辣椒\n");
        //    break;
        case 3:
            printf("爆炒妙脆角\n");
        //    break;
        case 4:
            printf("番茄炒卤蛋\n");
        //    break;
        case 5:
            printf("南瓜炒猪肝\n");
        //    break;
        case 6:
            printf("苹果炒西瓜\n");
        //    break;
        case 7:
            printf("天地无极\n");
        //    break;
        default:
            printf("error\n");
        //    break;
    }
输入1之后的输出结果:
玉米炒葡萄
月饼炒辣椒
爆炒妙脆角
番茄炒卤蛋
南瓜炒猪肝
苹果炒西瓜
天地无极
error
```

