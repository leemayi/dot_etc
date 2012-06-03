#!/bin/bash
if [ $1 == "ui" ]; then
source ~/.bash_profile; rm -rf ./*;cs co app/ecom/nova/ui;cs co -r ui_2-0-${2}_BRANCH app/ecom/nova/dep;cd app/ecom/nova/ui;svn sw https://svn.baidu.com/app/ecom/nova/branches/ui/ui_2-0-${2}_BRANCH;sh local_build.sh for_rb ui2.0.${1};
else
source ~/.bash_profile; rm -rf ./*;cs co app/ecom/nova/se;cs co -r ${1}_2-0-${2}_BRANCH app/ecom/nova/dep;cd app/ecom/nova/se/se-${1};svn sw https://svn.baidu.com/app/ecom/nova/branches/se/se-${1}/${1}_2-0-${2}_BRANCH;sh local_build.sh for_rb ${1}2.0.${1};
fi
