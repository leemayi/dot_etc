#!/bin/sh
if [ $# -gt 0 ]
then
    dir=$1
else
    dir="./"
fi
echo $dir
find $dir -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.cpp" -o -name "*.hpp" -o -name "*.py" -o -name "*.idl" > cscope.files
cscope -bkq -i cscope.files
ctags -R
ctags --c++-kinds=+p --fields=+iaS --extra=+q "$@"
