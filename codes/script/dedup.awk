#!/bin/env awk -f
BEGIN{
    last="";
    sum=0;
}
{
    if (length(last) == 0) {
        last=$1;
        sum=$2;
        next;
    }
    if($1 == last){
        is_print=0;
        sum+=$2;
    } else {
        print last"\t"sum;
        is_print=1;
        sum=$2;
        last=$1;
    }
}
END{
    if(is_print==0){
        print last"\t"sum;
    }
}

