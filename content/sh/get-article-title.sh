#!/bin/bash

# 把文章中第2行 title: "XXXX" 提取出来并放入 目录列表中

if [ 1 == 2 ]; then 
    fileName="hedge-fund.md"
    fileName=$1
    echo " $fileName start " 
    title=`head -2 ../$fileName | tail -1 | cut -d'"' -f2 -`
    echo $title
    item=" [$title](post/$fileName)" 
    echo $item | sed ':a;s/^/* /' >> res.md 
else
    for fileName in `cat ./ll.md`
    do
        echo " $fileName start " 
        title=`head -2 ../$fileName | tail -1 | cut -d'"' -f2 -`
        echo $title
        item=" [$title](post/$fileName)"
        echo $item | sed ':a;s/^/* /' >> res.md 
    done
fi
echo "done!"


# fileName="hedge-fund.md"
# echo " $fileName start "
# title=`head -2 ../$fileName | tail -1 | cut -d'"' -f2 -`
# echo $title

# # ## 把 $title 放入 某行
# item=" [$title](post/$fileName)"
# echo $item | sed ':a;s/^/* /'
