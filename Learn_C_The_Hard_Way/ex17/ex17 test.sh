#!/bin/bash

make ex17-4

echo "==============Creating database ...=============="
./ex17-4 db.dat c
echo ""

echo "======Saving zed, frank, joe to database ...====="
./ex17-4 db.dat s 1 zed zed@zedshaw.com
./ex17-4 db.dat s 2 frank frank@zedshaw.com
./ex17-4 db.dat s 3 joe joe@zedshaw.com
echo ""

echo "=============Printing all records ...============"
./ex17-4 db.dat l
echo ""

echo "===========Deleting record by id 3 ...==========="
./ex17-4 db.dat d 3
echo ""

echo "============Printing all records ...============="
./ex17-4 db.dat l
echo ""

echo "============Getting record by id 2 ...==========="
./ex17-4 db.dat g 2
echo ""

echo "======Saving zed, frank, joe to database ...====="
./ex17-4 db.dat s 4 zed zed@zedshaw.com
./ex17-4 db.dat s 5 frank frank@zedshaw.com
./ex17-4 db.dat s 6 joe joe@zedshaw.com
echo ""

echo "=============Printing all records ...============"
./ex17-4 db.dat l
echo ""

echo "===============Search for "zed" ...=============="
./ex17-4 db.dat f zed
echo ""

echo "===============Search for "joe" ...=============="
./ex17-4 db.dat f joe
echo ""

echo "=============Search for "xuivn" ...=============="
./ex17-4 db.dat f xuivn
echo ""
