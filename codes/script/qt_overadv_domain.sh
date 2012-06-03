#!/bin/bash

perl -e 'while($line=<>){if($line=~m/&qtf:4/ && $line=~m#//([^/]+)/#) {print "$1\n";}}' $1 |LANG=En_US sort -u domain_5207_qtf4 > domain_5207_qtf4_sort
../../tools/code/sitestr_map_keep ../../adinfo/domaininfo.dat domain_5207_qtf4_sort 0 0
