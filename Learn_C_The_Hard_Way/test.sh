#!/bin/bash
set -e

make tset12
echo “编译成功”
echo ""

./tset12
