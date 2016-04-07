# switch-使用注意事项
##本小节知识点:
1. 【掌握】switch条件类型
2. 【掌握】case值的规定
3. 【掌握】default的位置问题

---

##1.switch条件类型
- 表达式的类型(case语句后的值)必须是整型或可以转变为整型的值 (byte、short、char和int类型)。

```
 switch (10.10){ // 报错
        case 1:
            printf("玉米炒葡萄\n");
            break;
        default:
            printf("error\n");
            break;
    }
```
---

##2.case值的规定
- case的值必须是是整型或可以转变为整型的值
```
 switch (10){
        case 1:
            printf("玉米炒葡萄\n");
            break;
        case 'a': // 字符可以转换为整型
            printf("玉米炒葡萄\n");
            break;
        case 10.8: // 报错
            printf("玉米炒葡萄\n");
            break;
        default:
            printf("error\n");
            break;
    }
```
- case的值1、值2...值n只能为常数或常量,不能为变量。
```
 int num = 5;
 switch (10){
        case num: // 变量报错
            printf("玉米炒葡萄\n");
            break;
        default:
            printf("error\n");
            break;
    }
```
- 如果在case后面定义的变量必须加上大括号
```

 switch (10){
        case num:{
            int num = 5;
            printf("num = %d", num);
            break;
        }
        default:
            printf("error\n");
            break;
    }
```
- switch中case后面的表达式的值不能相同
```
 switch (10){
        case 1:
            printf("玉米炒葡萄\n");
            break;
        case 1: // 和上面相同报错
            printf("玉米炒葡萄\n");
            break;
        default:
            printf("error\n");
            break;
    }
```
- case语句可以有任意多句,可以不用加括号“{}”
```
 switch (10){
        case 1:
            printf("玉米炒葡萄1\n");
            printf("玉米炒葡萄2\n");
            break;
        default:
            printf("error\n");
            break;
    }
```

---


##3.default的位置问题
- default可以省略
```
 switch (10){
        case 1:
            printf("玉米炒葡萄1\n");
            break;
    }
```
- default语句可以写在switch语句中的任意位置
```
 switch (10){
        default:
            printf("error\n");
            break;
        case 1:
            printf("玉米炒葡萄1\n");
            break;
    }
```
    + 执行流程:在执行的过程中,如果遇到break语句,则跳出switch语句。如果没有遇到break 语句,则一直执行到switch语句的结束。
---

