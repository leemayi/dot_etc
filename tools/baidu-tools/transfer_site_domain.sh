#!/bin/bash

awk '{print $1}' $1 | ./get_domain > middle_domain
awk '{for(i=2;i<=NF;i++) printf("%s\t",$i); printf("\n");}' $1 > middle_other
paste -d "\t" middle_domain middle_other | sort -T ./tmp -k1d > final_domain
