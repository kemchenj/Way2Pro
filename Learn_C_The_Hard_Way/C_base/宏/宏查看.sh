#! /bin/bash

echo "预编译进行中，代码中的PI会被转化为那一个常量"
gcc 6.4宏.c --save-temps
echo ""

echo "预编译完成，正在打开预编译好的i文件"
tail 6.4宏.i
