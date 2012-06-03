#COMAKE2 edit-mode: -*- Makefile -*-
####################64Bit Mode####################
ifeq ($(shell uname -m),x86_64)
CC=gcc
CXX=g++
CXXFLAGS=-pipe \
  -W \
  -Wall \
  -Werror
CFLAGS=-g \
  -pipe \
  -W \
  -Wall
CPPFLAGS=-D_GNU_SOURCE \
  -D__STDC_LIMIT_MACROS \
  -DVERSION=\"1.0.0.0\"
INCPATH=-I. \
  -I./include \
  -I../include \
  -I./output \
  -I./output/include
DEP_INCPATH=-I../share/dev/ufs_2_0/app/ecom/elib/ecommon-lib \
  -I../share/dev/ufs_2_0/app/ecom/elib/ecommon-lib/include \
  -I../share/dev/ufs_2_0/app/ecom/elib/ecommon-lib/output \
  -I../share/dev/ufs_2_0/app/ecom/elib/ecommon-lib/output/include \
  -I../share/dev/ufs_2_0/app/ecom/fcr/dep/plsa \
  -I../share/dev/ufs_2_0/app/ecom/fcr/dep/plsa/include \
  -I../share/dev/ufs_2_0/app/ecom/fcr/dep/plsa/output \
  -I../share/dev/ufs_2_0/app/ecom/fcr/dep/plsa/output/include \
  -I../share/dev/ufs_2_0/app/ecom/fcr/dep/query-kernel \
  -I../share/dev/ufs_2_0/app/ecom/fcr/dep/query-kernel/include \
  -I../share/dev/ufs_2_0/app/ecom/fcr/dep/query-kernel/output \
  -I../share/dev/ufs_2_0/app/ecom/fcr/dep/query-kernel/output/include \
  -I../share/dev/ufs_2_0/app/ecom/fcr/dep/wordner-ecom \
  -I../share/dev/ufs_2_0/app/ecom/fcr/dep/wordner-ecom/include \
  -I../share/dev/ufs_2_0/app/ecom/fcr/dep/wordner-ecom/output \
  -I../share/dev/ufs_2_0/app/ecom/fcr/dep/wordner-ecom/output/include \
  -I../share/dev/ufs_2_0/app/ecom/fcr/plsa-pzd \
  -I../share/dev/ufs_2_0/app/ecom/fcr/plsa-pzd/include \
  -I../share/dev/ufs_2_0/app/ecom/fcr/plsa-pzd/output \
  -I../share/dev/ufs_2_0/app/ecom/fcr/plsa-pzd/output/include \
  -I../share/dev/ufs_2_0/app/ecom/fcr/region \
  -I../share/dev/ufs_2_0/app/ecom/fcr/region/include \
  -I../share/dev/ufs_2_0/app/ecom/fcr/region/output \
  -I../share/dev/ufs_2_0/app/ecom/fcr/region/output/include \
  -I../share/dev/ufs_2_0/app/ecom/im/interface \
  -I../share/dev/ufs_2_0/app/ecom/im/interface/include \
  -I../share/dev/ufs_2_0/app/ecom/im/interface/output \
  -I../share/dev/ufs_2_0/app/ecom/im/interface/output/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/kate/kate-app \
  -I../share/dev/ufs_2_0/app/ecom/nova/kate/kate-app/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/kate/kate-app/output \
  -I../share/dev/ufs_2_0/app/ecom/nova/kate/kate-app/output/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/kate/kate-lib \
  -I../share/dev/ufs_2_0/app/ecom/nova/kate/kate-lib/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/kate/kate-lib/output \
  -I../share/dev/ufs_2_0/app/ecom/nova/kate/kate-lib/output/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/pfs/pfs-url-pattern \
  -I../share/dev/ufs_2_0/app/ecom/nova/pfs/pfs-url-pattern/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/pfs/pfs-url-pattern/output \
  -I../share/dev/ufs_2_0/app/ecom/nova/pfs/pfs-url-pattern/output/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/thirdparty/gflags \
  -I../share/dev/ufs_2_0/app/ecom/nova/thirdparty/gflags/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/thirdparty/gflags/output \
  -I../share/dev/ufs_2_0/app/ecom/nova/thirdparty/gflags/output/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/comm-val-recog-mock \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/comm-val-recog-mock/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/comm-val-recog-mock/output \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/comm-val-recog-mock/output/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/juejin-query-cls-mock \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/juejin-query-cls-mock/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/juejin-query-cls-mock/output \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/juejin-query-cls-mock/output/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/linear-svm-mock \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/linear-svm-mock/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/linear-svm-mock/output \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/linear-svm-mock/output/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/odict-mock \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/odict-mock/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/odict-mock/output \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/odict-mock/output/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/plsa-pzd-mock \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/plsa-pzd-mock/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/plsa-pzd-mock/output \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/plsa-pzd-mock/output/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/postag-mock \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/postag-mock/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/postag-mock/output \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/postag-mock/output/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/query-kernel-mock \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/query-kernel-mock/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/query-kernel-mock/output \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/query-kernel-mock/output/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/queryclass-mock \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/queryclass-mock/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/queryclass-mock/output \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/queryclass-mock/output/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/rewrite-mock \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/rewrite-mock/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/rewrite-mock/output \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/rewrite-mock/output/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/str-parser \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/str-parser/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/str-parser/output \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/str-parser/output/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/ullibex-mock \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/ullibex-mock/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/ullibex-mock/output \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/ullibex-mock/output/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/wordner-ecom-mock \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/wordner-ecom-mock/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/wordner-ecom-mock/output \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/wordner-ecom-mock/output/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/wordner-mock \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/wordner-mock/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/wordner-mock/output \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/wordner-mock/output/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/wordrank-mock \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/wordrank-mock/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/wordrank-mock/output \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/wordrank-mock/output/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/wordseg-mock \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/wordseg-mock/include \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/wordseg-mock/output \
  -I../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/wordseg-mock/output/include \
  -I../share/dev/ufs_2_0/app/ecom/ufs/util \
  -I../share/dev/ufs_2_0/app/ecom/ufs/util/include \
  -I../share/dev/ufs_2_0/app/ecom/ufs/util/output \
  -I../share/dev/ufs_2_0/app/ecom/ufs/util/output/include \
  -I../share/dev/ufs_2_0/app/ecom/ufs/utility/strutil \
  -I../share/dev/ufs_2_0/app/ecom/ufs/utility/strutil/include \
  -I../share/dev/ufs_2_0/app/ecom/ufs/utility/strutil/output \
  -I../share/dev/ufs_2_0/app/ecom/ufs/utility/strutil/output/include \
  -I../share/dev/ufs_2_0/com/btest/googlemock \
  -I../share/dev/ufs_2_0/com/btest/googlemock/include \
  -I../share/dev/ufs_2_0/com/btest/googlemock/output \
  -I../share/dev/ufs_2_0/com/btest/googlemock/output/include \
  -I../share/dev/ufs_2_0/com/btest/gtest \
  -I../share/dev/ufs_2_0/com/btest/gtest/include \
  -I../share/dev/ufs_2_0/com/btest/gtest/output \
  -I../share/dev/ufs_2_0/com/btest/gtest/output/include \
  -I../share/dev/ufs_2_0/com/idlcompiler \
  -I../share/dev/ufs_2_0/com/idlcompiler/include \
  -I../share/dev/ufs_2_0/com/idlcompiler/output \
  -I../share/dev/ufs_2_0/com/idlcompiler/output/include \
  -I../share/dev/ufs_2_0/lib2-64/bsl \
  -I../share/dev/ufs_2_0/lib2-64/bsl/include \
  -I../share/dev/ufs_2_0/lib2-64/bsl/output \
  -I../share/dev/ufs_2_0/lib2-64/bsl/output/include \
  -I../share/dev/ufs_2_0/lib2-64/cache \
  -I../share/dev/ufs_2_0/lib2-64/cache/include \
  -I../share/dev/ufs_2_0/lib2-64/cache/output \
  -I../share/dev/ufs_2_0/lib2-64/cache/output/include \
  -I../share/dev/ufs_2_0/lib2-64/ccode \
  -I../share/dev/ufs_2_0/lib2-64/ccode/include \
  -I../share/dev/ufs_2_0/lib2-64/ccode/output \
  -I../share/dev/ufs_2_0/lib2-64/ccode/output/include \
  -I../share/dev/ufs_2_0/lib2-64/comm-val-recog \
  -I../share/dev/ufs_2_0/lib2-64/comm-val-recog/include \
  -I../share/dev/ufs_2_0/lib2-64/comm-val-recog/output \
  -I../share/dev/ufs_2_0/lib2-64/comm-val-recog/output/include \
  -I../share/dev/ufs_2_0/lib2-64/dict \
  -I../share/dev/ufs_2_0/lib2-64/dict/include \
  -I../share/dev/ufs_2_0/lib2-64/dict/output \
  -I../share/dev/ufs_2_0/lib2-64/dict/output/include \
  -I../share/dev/ufs_2_0/lib2-64/http \
  -I../share/dev/ufs_2_0/lib2-64/http/include \
  -I../share/dev/ufs_2_0/lib2-64/http/output \
  -I../share/dev/ufs_2_0/lib2-64/http/output/include \
  -I../share/dev/ufs_2_0/lib2-64/libcrf \
  -I../share/dev/ufs_2_0/lib2-64/libcrf/include \
  -I../share/dev/ufs_2_0/lib2-64/libcrf/output \
  -I../share/dev/ufs_2_0/lib2-64/libcrf/output/include \
  -I../share/dev/ufs_2_0/lib2-64/max-entropy \
  -I../share/dev/ufs_2_0/lib2-64/max-entropy/include \
  -I../share/dev/ufs_2_0/lib2-64/max-entropy/output \
  -I../share/dev/ufs_2_0/lib2-64/max-entropy/output/include \
  -I../share/dev/ufs_2_0/lib2-64/nlp-pub \
  -I../share/dev/ufs_2_0/lib2-64/nlp-pub/include \
  -I../share/dev/ufs_2_0/lib2-64/nlp-pub/output \
  -I../share/dev/ufs_2_0/lib2-64/nlp-pub/output/include \
  -I../share/dev/ufs_2_0/lib2-64/others-ex \
  -I../share/dev/ufs_2_0/lib2-64/others-ex/include \
  -I../share/dev/ufs_2_0/lib2-64/others-ex/output \
  -I../share/dev/ufs_2_0/lib2-64/others-ex/output/include \
  -I../share/dev/ufs_2_0/lib2-64/postag \
  -I../share/dev/ufs_2_0/lib2-64/postag/include \
  -I../share/dev/ufs_2_0/lib2-64/postag/output \
  -I../share/dev/ufs_2_0/lib2-64/postag/output/include \
  -I../share/dev/ufs_2_0/lib2-64/queryclass \
  -I../share/dev/ufs_2_0/lib2-64/queryclass/include \
  -I../share/dev/ufs_2_0/lib2-64/queryclass/output \
  -I../share/dev/ufs_2_0/lib2-64/queryclass/output/include \
  -I../share/dev/ufs_2_0/lib2-64/rewrite \
  -I../share/dev/ufs_2_0/lib2-64/rewrite/include \
  -I../share/dev/ufs_2_0/lib2-64/rewrite/output \
  -I../share/dev/ufs_2_0/lib2-64/rewrite/output/include \
  -I../share/dev/ufs_2_0/lib2-64/svm \
  -I../share/dev/ufs_2_0/lib2-64/svm/include \
  -I../share/dev/ufs_2_0/lib2-64/svm/output \
  -I../share/dev/ufs_2_0/lib2-64/svm/output/include \
  -I../share/dev/ufs_2_0/lib2-64/ullib \
  -I../share/dev/ufs_2_0/lib2-64/ullib/include \
  -I../share/dev/ufs_2_0/lib2-64/ullib/output \
  -I../share/dev/ufs_2_0/lib2-64/ullib/output/include \
  -I../share/dev/ufs_2_0/lib2-64/wordner \
  -I../share/dev/ufs_2_0/lib2-64/wordner/include \
  -I../share/dev/ufs_2_0/lib2-64/wordner/output \
  -I../share/dev/ufs_2_0/lib2-64/wordner/output/include \
  -I../share/dev/ufs_2_0/lib2-64/wordrank \
  -I../share/dev/ufs_2_0/lib2-64/wordrank/include \
  -I../share/dev/ufs_2_0/lib2-64/wordrank/output \
  -I../share/dev/ufs_2_0/lib2-64/wordrank/output/include \
  -I../share/dev/ufs_2_0/lib2-64/wordseg \
  -I../share/dev/ufs_2_0/lib2-64/wordseg/include \
  -I../share/dev/ufs_2_0/lib2-64/wordseg/output \
  -I../share/dev/ufs_2_0/lib2-64/wordseg/output/include \
  -I../share/dev/ufs_2_0/ps/se/dict-set \
  -I../share/dev/ufs_2_0/ps/se/dict-set/include \
  -I../share/dev/ufs_2_0/ps/se/dict-set/output \
  -I../share/dev/ufs_2_0/ps/se/dict-set/output/include \
  -I../share/dev/ufs_2_0/ps/se/include \
  -I../share/dev/ufs_2_0/ps/se/include/include \
  -I../share/dev/ufs_2_0/ps/se/include/output \
  -I../share/dev/ufs_2_0/ps/se/include/output/include \
  -I../share/dev/ufs_2_0/public/bslext \
  -I../share/dev/ufs_2_0/public/bslext/include \
  -I../share/dev/ufs_2_0/public/bslext/output \
  -I../share/dev/ufs_2_0/public/bslext/output/include \
  -I../share/dev/ufs_2_0/public/comlog-plugin \
  -I../share/dev/ufs_2_0/public/comlog-plugin/include \
  -I../share/dev/ufs_2_0/public/comlog-plugin/output \
  -I../share/dev/ufs_2_0/public/comlog-plugin/output/include \
  -I../share/dev/ufs_2_0/public/configure \
  -I../share/dev/ufs_2_0/public/configure/include \
  -I../share/dev/ufs_2_0/public/configure/output \
  -I../share/dev/ufs_2_0/public/configure/output/include \
  -I../share/dev/ufs_2_0/public/connectpool \
  -I../share/dev/ufs_2_0/public/connectpool/include \
  -I../share/dev/ufs_2_0/public/connectpool/output \
  -I../share/dev/ufs_2_0/public/connectpool/output/include \
  -I../share/dev/ufs_2_0/public/fileio \
  -I../share/dev/ufs_2_0/public/fileio/include \
  -I../share/dev/ufs_2_0/public/fileio/output \
  -I../share/dev/ufs_2_0/public/fileio/output/include \
  -I../share/dev/ufs_2_0/public/gm/galileo \
  -I../share/dev/ufs_2_0/public/gm/galileo/include \
  -I../share/dev/ufs_2_0/public/gm/galileo/output \
  -I../share/dev/ufs_2_0/public/gm/galileo/output/include \
  -I../share/dev/ufs_2_0/public/gm/mola2 \
  -I../share/dev/ufs_2_0/public/gm/mola2/include \
  -I../share/dev/ufs_2_0/public/gm/mola2/output \
  -I../share/dev/ufs_2_0/public/gm/mola2/output/include \
  -I../share/dev/ufs_2_0/public/gm/zcacheapi \
  -I../share/dev/ufs_2_0/public/gm/zcacheapi/include \
  -I../share/dev/ufs_2_0/public/gm/zcacheapi/output \
  -I../share/dev/ufs_2_0/public/gm/zcacheapi/output/include \
  -I../share/dev/ufs_2_0/public/idlcompiler \
  -I../share/dev/ufs_2_0/public/idlcompiler/include \
  -I../share/dev/ufs_2_0/public/idlcompiler/output \
  -I../share/dev/ufs_2_0/public/idlcompiler/output/include \
  -I../share/dev/ufs_2_0/public/kylin \
  -I../share/dev/ufs_2_0/public/kylin/include \
  -I../share/dev/ufs_2_0/public/kylin/output \
  -I../share/dev/ufs_2_0/public/kylin/output/include \
  -I../share/dev/ufs_2_0/public/mcpack \
  -I../share/dev/ufs_2_0/public/mcpack/include \
  -I../share/dev/ufs_2_0/public/mcpack/output \
  -I../share/dev/ufs_2_0/public/mcpack/output/include \
  -I../share/dev/ufs_2_0/public/ns/mynet \
  -I../share/dev/ufs_2_0/public/ns/mynet/include \
  -I../share/dev/ufs_2_0/public/ns/mynet/output \
  -I../share/dev/ufs_2_0/public/ns/mynet/output/include \
  -I../share/dev/ufs_2_0/public/nshead \
  -I../share/dev/ufs_2_0/public/nshead/include \
  -I../share/dev/ufs_2_0/public/nshead/output \
  -I../share/dev/ufs_2_0/public/nshead/output/include \
  -I../share/dev/ufs_2_0/public/odict \
  -I../share/dev/ufs_2_0/public/odict/include \
  -I../share/dev/ufs_2_0/public/odict/output \
  -I../share/dev/ufs_2_0/public/odict/output/include \
  -I../share/dev/ufs_2_0/public/spreg \
  -I../share/dev/ufs_2_0/public/spreg/include \
  -I../share/dev/ufs_2_0/public/spreg/output \
  -I../share/dev/ufs_2_0/public/spreg/output/include \
  -I../share/dev/ufs_2_0/public/ub \
  -I../share/dev/ufs_2_0/public/ub/include \
  -I../share/dev/ufs_2_0/public/ub/output \
  -I../share/dev/ufs_2_0/public/ub/output/include \
  -I../share/dev/ufs_2_0/public/ubrpc \
  -I../share/dev/ufs_2_0/public/ubrpc/include \
  -I../share/dev/ufs_2_0/public/ubrpc/output \
  -I../share/dev/ufs_2_0/public/ubrpc/output/include \
  -I../share/dev/ufs_2_0/public/uconv \
  -I../share/dev/ufs_2_0/public/uconv/include \
  -I../share/dev/ufs_2_0/public/uconv/output \
  -I../share/dev/ufs_2_0/public/uconv/output/include \
  -I../share/dev/ufs_2_0/public/urlparser \
  -I../share/dev/ufs_2_0/public/urlparser/include \
  -I../share/dev/ufs_2_0/public/urlparser/output \
  -I../share/dev/ufs_2_0/public/urlparser/output/include \
  -I../share/dev/ufs_2_0/quality/autotest/reportlib/cpp \
  -I../share/dev/ufs_2_0/quality/autotest/reportlib/cpp/include \
  -I../share/dev/ufs_2_0/quality/autotest/reportlib/cpp/output \
  -I../share/dev/ufs_2_0/quality/autotest/reportlib/cpp/output/include \
  -I../share/dev/ufs_2_0/st/nlp/classification/juejin-query-cls \
  -I../share/dev/ufs_2_0/st/nlp/classification/juejin-query-cls/include \
  -I../share/dev/ufs_2_0/st/nlp/classification/juejin-query-cls/output \
  -I../share/dev/ufs_2_0/st/nlp/classification/juejin-query-cls/output/include \
  -I../share/dev/ufs_2_0/st/nlp/lexparser \
  -I../share/dev/ufs_2_0/st/nlp/lexparser/include \
  -I../share/dev/ufs_2_0/st/nlp/lexparser/output \
  -I../share/dev/ufs_2_0/st/nlp/lexparser/output/include \
  -I../share/dev/ufs_2_0/sys/dpf/hadoop/ant \
  -I../share/dev/ufs_2_0/sys/dpf/hadoop/ant/include \
  -I../share/dev/ufs_2_0/sys/dpf/hadoop/ant/output \
  -I../share/dev/ufs_2_0/sys/dpf/hadoop/ant/output/include \
  -I../share/dev/ufs_2_0/sys/dpf/hadoop/hadoop-core \
  -I../share/dev/ufs_2_0/sys/dpf/hadoop/hadoop-core/include \
  -I../share/dev/ufs_2_0/sys/dpf/hadoop/hadoop-core/output \
  -I../share/dev/ufs_2_0/sys/dpf/hadoop/hadoop-core/output/include \
  -I../share/dev/ufs_2_0/sys/dpf/hadoop/java6 \
  -I../share/dev/ufs_2_0/sys/dpf/hadoop/java6/include \
  -I../share/dev/ufs_2_0/sys/dpf/hadoop/java6/output \
  -I../share/dev/ufs_2_0/sys/dpf/hadoop/java6/output/include \
  -I../share/dev/ufs_2_0/third-64/boost \
  -I../share/dev/ufs_2_0/third-64/boost/include \
  -I../share/dev/ufs_2_0/third-64/boost/output \
  -I../share/dev/ufs_2_0/third-64/boost/output/include \
  -I../share/dev/ufs_2_0/third-64/pcre \
  -I../share/dev/ufs_2_0/third-64/pcre/include \
  -I../share/dev/ufs_2_0/third-64/pcre/output \
  -I../share/dev/ufs_2_0/third-64/pcre/output/include \
  -I../share/dev/ufs_2_0/third-64/protobuf \
  -I../share/dev/ufs_2_0/third-64/protobuf/include \
  -I../share/dev/ufs_2_0/third-64/protobuf/output \
  -I../share/dev/ufs_2_0/third-64/protobuf/output/include \
  -I../share/dev/ufs_2_0/third-64/stlport \
  -I../share/dev/ufs_2_0/third-64/stlport/include \
  -I../share/dev/ufs_2_0/third-64/stlport/output \
  -I../share/dev/ufs_2_0/third-64/stlport/output/include \
  -I../share/dev/ufs_2_0/third-64/tbb \
  -I../share/dev/ufs_2_0/third-64/tbb/include \
  -I../share/dev/ufs_2_0/third-64/tbb/output \
  -I../share/dev/ufs_2_0/third-64/tbb/output/include \
  -I../share/dev/ufs_2_0/thirdsrc/protobuf \
  -I../share/dev/ufs_2_0/thirdsrc/protobuf/include \
  -I../share/dev/ufs_2_0/thirdsrc/protobuf/output \
  -I../share/dev/ufs_2_0/thirdsrc/protobuf/output/include \
  -I../share/dev/ufs_2_0/thirdsrc/zookeeper \
  -I../share/dev/ufs_2_0/thirdsrc/zookeeper/include \
  -I../share/dev/ufs_2_0/thirdsrc/zookeeper/output \
  -I../share/dev/ufs_2_0/thirdsrc/zookeeper/output/include

#============ CCP vars ============
CCHECK=@ccheck.py
CCHECK_FLAGS=
PCLINT=@pclint
PCLINT_FLAGS=
CCP=@ccp.py
CCP_FLAGS=


.PHONY:all
all:comake2_makefile_check de_baiduid mod_cookie join_int join_str word_freq gen_dmdict get_domain 
	@echo "[[1;32;40mCOMAKE:BUILD[0m][Target:'[1;32;40mall[0m']"
	@echo "make all done"

.PHONY:comake2_makefile_check
comake2_makefile_check:
	@echo "[[1;32;40mCOMAKE:BUILD[0m][Target:'[1;32;40mcomake2_makefile_check[0m']"
	@if [ "COMAKE" -nt "Makefile" ] ; then echo "[ERROR]PLEASE UPDATE 'Makefile' BY 'comake2'" ; exit 250 ;  fi

.PHONY:ccpclean
ccpclean:
	@echo "[[1;32;40mCOMAKE:BUILD[0m][Target:'[1;32;40mccpclean[0m']"
	@echo "make ccpclean done"

.PHONY:clean
clean:ccpclean
	@echo "[[1;32;40mCOMAKE:BUILD[0m][Target:'[1;32;40mclean[0m']"
	rm -rf de_baiduid
	rm -rf ./output/bin/de_baiduid
	rm -rf mod_cookie
	rm -rf ./output/bin/mod_cookie
	rm -rf join_int
	rm -rf ./output/bin/join_int
	rm -rf join_str
	rm -rf ./output/bin/join_str
	rm -rf word_freq
	rm -rf ./output/bin/word_freq
	rm -rf gen_dmdict
	rm -rf ./output/bin/gen_dmdict
	rm -rf get_domain
	rm -rf ./output/bin/get_domain
	rm -rf src/de_baiduid_de_baiduid.o
	rm -rf src/mod_cookie_mod_cookie.o
	rm -rf src/join_int_join_int.o
	rm -rf src/join_str_join_str.o
	rm -rf src/word_freq_word_freq.o
	rm -rf src/gen_dmdict_gen_dmdict.o
	rm -rf src/get_domain_get_domain.o

.PHONY:dist
dist:clean
	@echo "[[1;32;40mCOMAKE:BUILD[0m][Target:'[1;32;40mdist[0m']"
	cd ..;tar czvf code.tar.gz code;cd code

.PHONY:love
love:
	@echo "[[1;32;40mCOMAKE:BUILD[0m][Target:'[1;32;40mlove[0m']"
	@echo "make love done"

de_baiduid:src/de_baiduid_de_baiduid.o
	@echo "[[1;32;40mCOMAKE:BUILD[0m][Target:'[1;32;40mde_baiduid[0m']"
	$(CXX) src/de_baiduid_de_baiduid.o -Xlinker "-("  ../share/dev/ufs_2_0/app/ecom/elib/ecommon-lib/libellib.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/dep/plsa/libplsa_ecom.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/dep/plsa/libplsa_models.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/dep/query-kernel/libquery_kernel.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/dep/wordner-ecom/output/lib/libwordner.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/plsa-pzd/libplsa_pzd.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/region/libregion_match.a \
  ../share/dev/ufs_2_0/app/ecom/nova/kate/kate-app/output/lib/libkate-app.a \
  ../share/dev/ufs_2_0/app/ecom/nova/kate/kate-lib/libkate-lib.a \
  ../share/dev/ufs_2_0/app/ecom/nova/pfs/pfs-url-pattern/output/lib/libul-patt.a \
  ../share/dev/ufs_2_0/app/ecom/nova/thirdparty/gflags/output/lib/libgflags.a \
  ../share/dev/ufs_2_0/app/ecom/nova/thirdparty/gflags/output/lib/libgflags_nothreads.a \
  ../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/str-parser/libstr-parser.a \
  ../share/dev/ufs_2_0/app/ecom/ufs/util/libufs-util.a \
  ../share/dev/ufs_2_0/app/ecom/ufs/utility/strutil/libstrutil.a \
  ../share/dev/ufs_2_0/com/btest/googlemock/output/lib/libgmock.a \
  ../share/dev/ufs_2_0/com/btest/googlemock/output/lib/libgmock_main.a \
  ../share/dev/ufs_2_0/com/btest/gtest/output/lib/libgtest.a \
  ../share/dev/ufs_2_0/com/btest/gtest/output/lib/libgtest_main.a \
  ../share/dev/ufs_2_0/com/idlcompiler/astyle/libastyle.a \
  ../share/dev/ufs_2_0/com/idlcompiler/cxx/libskeleton.a \
  ../share/dev/ufs_2_0/com/idlcompiler/parser/libparser.a \
  ../share/dev/ufs_2_0/lib2-64/bsl/lib/libbsl.a \
  ../share/dev/ufs_2_0/lib2-64/cache/lib/libmcache.a \
  ../share/dev/ufs_2_0/lib2-64/ccode/lib/libulccode.a \
  ../share/dev/ufs_2_0/lib2-64/comm-val-recog/lib/libcomm_val_recog.a \
  ../share/dev/ufs_2_0/lib2-64/dict/lib/libuldict.a \
  ../share/dev/ufs_2_0/lib2-64/http/lib/libnewhttp.a \
  ../share/dev/ufs_2_0/lib2-64/libcrf/lib/libcrf.a \
  ../share/dev/ufs_2_0/lib2-64/max-entropy/lib/libmax_entropy.a \
  ../share/dev/ufs_2_0/lib2-64/nlp-pub/lib/libnlppub.a \
  ../share/dev/ufs_2_0/lib2-64/others-ex/lib/libullib_ex.a \
  ../share/dev/ufs_2_0/lib2-64/postag/lib/libpostag.a \
  ../share/dev/ufs_2_0/lib2-64/queryclass/libqueryclass.a \
  ../share/dev/ufs_2_0/lib2-64/rewrite/lib/librewrite.a \
  ../share/dev/ufs_2_0/lib2-64/svm/lib/liblinear_svm.a \
  ../share/dev/ufs_2_0/lib2-64/ullib/lib/libullib.a \
  ../share/dev/ufs_2_0/lib2-64/wordner/lib/libwordner.a \
  ../share/dev/ufs_2_0/lib2-64/wordrank/lib/libwordrank.a \
  ../share/dev/ufs_2_0/lib2-64/wordseg/libsegment.a \
  ../share/dev/ufs_2_0/ps/se/dict-set/libdictset.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_bml.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_containers_utils.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_var_scripting.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_var_serializer.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_var_vscript.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_vs.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbslext.a \
  ../share/dev/ufs_2_0/public/comlog-plugin/libcomlog.a \
  ../share/dev/ufs_2_0/public/comlog-plugin/output/lib/libdfsappender.a \
  ../share/dev/ufs_2_0/public/configure/libconfig.a \
  ../share/dev/ufs_2_0/public/connectpool/libconnectpool.a \
  ../share/dev/ufs_2_0/public/fileio/libfileio.a \
  ../share/dev/ufs_2_0/public/gm/galileo/libgalileo.a \
  ../share/dev/ufs_2_0/public/gm/galileo/output/lib/libzookeeper_mt.a \
  ../share/dev/ufs_2_0/public/gm/mola2/libmola.a \
  ../share/dev/ufs_2_0/public/gm/zcacheapi/lib/libzcachecommon.a \
  ../share/dev/ufs_2_0/public/gm/zcacheapi/output/lib/libzcacheapi.a \
  ../share/dev/ufs_2_0/public/gm/zcacheapi/output/lib/libzcacheapiplus.a \
  ../share/dev/ufs_2_0/public/idlcompiler/output/lib/libmcpack_idl.a \
  ../share/dev/ufs_2_0/public/kylin/output/libkylin.a \
  ../share/dev/ufs_2_0/public/kylin/output/libshare.a \
  ../share/dev/ufs_2_0/public/mcpack/libmcpack.a \
  ../share/dev/ufs_2_0/public/ns/mynet/libmynet.a \
  ../share/dev/ufs_2_0/public/nshead/libnshead.a \
  ../share/dev/ufs_2_0/public/odict/libodict.a \
  ../share/dev/ufs_2_0/public/spreg/libspreg.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_aserver.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_client.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_conf.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_galileo.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_log.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_misc.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_monitor.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_server.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libubex.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libubfw.a \
  ../share/dev/ufs_2_0/public/ubrpc/output/lib/libclient.a \
  ../share/dev/ufs_2_0/public/ubrpc/output/lib/libservlet.a \
  ../share/dev/ufs_2_0/public/uconv/libuconv.a \
  ../share/dev/ufs_2_0/public/urlparser/libnewurl.a \
  ../share/dev/ufs_2_0/quality/autotest/reportlib/cpp/libautotest.a \
  ../share/dev/ufs_2_0/st/nlp/classification/juejin-query-cls/libjuejin_query_cls.a \
  ../share/dev/ufs_2_0/st/nlp/lexparser/liblexparser.a \
  ../share/dev/ufs_2_0/sys/dpf/hadoop/hadoop-core/output/lib/native/Linux-amd64-64/libhadoop.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_date_time.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_filesystem.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_graph.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_iostreams.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_c99.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_c99f.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_c99l.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_tr1.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_tr1f.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_tr1l.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_prg_exec_monitor.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_program_options.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_python.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_random.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_regex.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_serialization.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_signals.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_system.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_test_exec_monitor.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_thread.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_unit_test_framework.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_wave.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_wserialization.a \
  ../share/dev/ufs_2_0/third-64/pcre/lib/libpcre.a \
  ../share/dev/ufs_2_0/third-64/pcre/lib/libpcrecpp.a \
  ../share/dev/ufs_2_0/third-64/pcre/lib/libpcreposix.a \
  ../share/dev/ufs_2_0/third-64/protobuf/lib/libprotobuf.a \
  ../share/dev/ufs_2_0/third-64/protobuf/lib/libprotoc.a \
  ../share/dev/ufs_2_0/third-64/tbb/lib/libtbb.a \
  ../share/dev/ufs_2_0/thirdsrc/protobuf/output/lib/libprotobuf-lite.a \
  ../share/dev/ufs_2_0/thirdsrc/protobuf/output/lib/libprotobuf.a \
  ../share/dev/ufs_2_0/thirdsrc/protobuf/output/lib/libprotoc.a \
  ../share/dev/ufs_2_0/thirdsrc/zookeeper/output/lib/libzookeeper_mt.a \
  ../share/dev/ufs_2_0/thirdsrc/zookeeper/output/lib/libzookeeper_st.a -lpthread \
  -lcrypto \
  -lrt -Xlinker "-)" -o de_baiduid
	mkdir -p ./output/bin
	cp -f --link de_baiduid ./output/bin

mod_cookie:src/mod_cookie_mod_cookie.o
	@echo "[[1;32;40mCOMAKE:BUILD[0m][Target:'[1;32;40mmod_cookie[0m']"
	$(CXX) src/mod_cookie_mod_cookie.o -Xlinker "-("  ../share/dev/ufs_2_0/app/ecom/elib/ecommon-lib/libellib.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/dep/plsa/libplsa_ecom.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/dep/plsa/libplsa_models.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/dep/query-kernel/libquery_kernel.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/dep/wordner-ecom/output/lib/libwordner.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/plsa-pzd/libplsa_pzd.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/region/libregion_match.a \
  ../share/dev/ufs_2_0/app/ecom/nova/kate/kate-app/output/lib/libkate-app.a \
  ../share/dev/ufs_2_0/app/ecom/nova/kate/kate-lib/libkate-lib.a \
  ../share/dev/ufs_2_0/app/ecom/nova/pfs/pfs-url-pattern/output/lib/libul-patt.a \
  ../share/dev/ufs_2_0/app/ecom/nova/thirdparty/gflags/output/lib/libgflags.a \
  ../share/dev/ufs_2_0/app/ecom/nova/thirdparty/gflags/output/lib/libgflags_nothreads.a \
  ../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/str-parser/libstr-parser.a \
  ../share/dev/ufs_2_0/app/ecom/ufs/util/libufs-util.a \
  ../share/dev/ufs_2_0/app/ecom/ufs/utility/strutil/libstrutil.a \
  ../share/dev/ufs_2_0/com/btest/googlemock/output/lib/libgmock.a \
  ../share/dev/ufs_2_0/com/btest/googlemock/output/lib/libgmock_main.a \
  ../share/dev/ufs_2_0/com/btest/gtest/output/lib/libgtest.a \
  ../share/dev/ufs_2_0/com/btest/gtest/output/lib/libgtest_main.a \
  ../share/dev/ufs_2_0/com/idlcompiler/astyle/libastyle.a \
  ../share/dev/ufs_2_0/com/idlcompiler/cxx/libskeleton.a \
  ../share/dev/ufs_2_0/com/idlcompiler/parser/libparser.a \
  ../share/dev/ufs_2_0/lib2-64/bsl/lib/libbsl.a \
  ../share/dev/ufs_2_0/lib2-64/cache/lib/libmcache.a \
  ../share/dev/ufs_2_0/lib2-64/ccode/lib/libulccode.a \
  ../share/dev/ufs_2_0/lib2-64/comm-val-recog/lib/libcomm_val_recog.a \
  ../share/dev/ufs_2_0/lib2-64/dict/lib/libuldict.a \
  ../share/dev/ufs_2_0/lib2-64/http/lib/libnewhttp.a \
  ../share/dev/ufs_2_0/lib2-64/libcrf/lib/libcrf.a \
  ../share/dev/ufs_2_0/lib2-64/max-entropy/lib/libmax_entropy.a \
  ../share/dev/ufs_2_0/lib2-64/nlp-pub/lib/libnlppub.a \
  ../share/dev/ufs_2_0/lib2-64/others-ex/lib/libullib_ex.a \
  ../share/dev/ufs_2_0/lib2-64/postag/lib/libpostag.a \
  ../share/dev/ufs_2_0/lib2-64/queryclass/libqueryclass.a \
  ../share/dev/ufs_2_0/lib2-64/rewrite/lib/librewrite.a \
  ../share/dev/ufs_2_0/lib2-64/svm/lib/liblinear_svm.a \
  ../share/dev/ufs_2_0/lib2-64/ullib/lib/libullib.a \
  ../share/dev/ufs_2_0/lib2-64/wordner/lib/libwordner.a \
  ../share/dev/ufs_2_0/lib2-64/wordrank/lib/libwordrank.a \
  ../share/dev/ufs_2_0/lib2-64/wordseg/libsegment.a \
  ../share/dev/ufs_2_0/ps/se/dict-set/libdictset.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_bml.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_containers_utils.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_var_scripting.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_var_serializer.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_var_vscript.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_vs.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbslext.a \
  ../share/dev/ufs_2_0/public/comlog-plugin/libcomlog.a \
  ../share/dev/ufs_2_0/public/comlog-plugin/output/lib/libdfsappender.a \
  ../share/dev/ufs_2_0/public/configure/libconfig.a \
  ../share/dev/ufs_2_0/public/connectpool/libconnectpool.a \
  ../share/dev/ufs_2_0/public/fileio/libfileio.a \
  ../share/dev/ufs_2_0/public/gm/galileo/libgalileo.a \
  ../share/dev/ufs_2_0/public/gm/galileo/output/lib/libzookeeper_mt.a \
  ../share/dev/ufs_2_0/public/gm/mola2/libmola.a \
  ../share/dev/ufs_2_0/public/gm/zcacheapi/lib/libzcachecommon.a \
  ../share/dev/ufs_2_0/public/gm/zcacheapi/output/lib/libzcacheapi.a \
  ../share/dev/ufs_2_0/public/gm/zcacheapi/output/lib/libzcacheapiplus.a \
  ../share/dev/ufs_2_0/public/idlcompiler/output/lib/libmcpack_idl.a \
  ../share/dev/ufs_2_0/public/kylin/output/libkylin.a \
  ../share/dev/ufs_2_0/public/kylin/output/libshare.a \
  ../share/dev/ufs_2_0/public/mcpack/libmcpack.a \
  ../share/dev/ufs_2_0/public/ns/mynet/libmynet.a \
  ../share/dev/ufs_2_0/public/nshead/libnshead.a \
  ../share/dev/ufs_2_0/public/odict/libodict.a \
  ../share/dev/ufs_2_0/public/spreg/libspreg.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_aserver.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_client.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_conf.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_galileo.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_log.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_misc.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_monitor.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_server.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libubex.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libubfw.a \
  ../share/dev/ufs_2_0/public/ubrpc/output/lib/libclient.a \
  ../share/dev/ufs_2_0/public/ubrpc/output/lib/libservlet.a \
  ../share/dev/ufs_2_0/public/uconv/libuconv.a \
  ../share/dev/ufs_2_0/public/urlparser/libnewurl.a \
  ../share/dev/ufs_2_0/quality/autotest/reportlib/cpp/libautotest.a \
  ../share/dev/ufs_2_0/st/nlp/classification/juejin-query-cls/libjuejin_query_cls.a \
  ../share/dev/ufs_2_0/st/nlp/lexparser/liblexparser.a \
  ../share/dev/ufs_2_0/sys/dpf/hadoop/hadoop-core/output/lib/native/Linux-amd64-64/libhadoop.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_date_time.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_filesystem.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_graph.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_iostreams.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_c99.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_c99f.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_c99l.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_tr1.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_tr1f.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_tr1l.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_prg_exec_monitor.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_program_options.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_python.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_random.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_regex.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_serialization.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_signals.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_system.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_test_exec_monitor.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_thread.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_unit_test_framework.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_wave.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_wserialization.a \
  ../share/dev/ufs_2_0/third-64/pcre/lib/libpcre.a \
  ../share/dev/ufs_2_0/third-64/pcre/lib/libpcrecpp.a \
  ../share/dev/ufs_2_0/third-64/pcre/lib/libpcreposix.a \
  ../share/dev/ufs_2_0/third-64/protobuf/lib/libprotobuf.a \
  ../share/dev/ufs_2_0/third-64/protobuf/lib/libprotoc.a \
  ../share/dev/ufs_2_0/third-64/tbb/lib/libtbb.a \
  ../share/dev/ufs_2_0/thirdsrc/protobuf/output/lib/libprotobuf-lite.a \
  ../share/dev/ufs_2_0/thirdsrc/protobuf/output/lib/libprotobuf.a \
  ../share/dev/ufs_2_0/thirdsrc/protobuf/output/lib/libprotoc.a \
  ../share/dev/ufs_2_0/thirdsrc/zookeeper/output/lib/libzookeeper_mt.a \
  ../share/dev/ufs_2_0/thirdsrc/zookeeper/output/lib/libzookeeper_st.a -lpthread \
  -lcrypto \
  -lrt -Xlinker "-)" -o mod_cookie
	mkdir -p ./output/bin
	cp -f --link mod_cookie ./output/bin

join_int:src/join_int_join_int.o
	@echo "[[1;32;40mCOMAKE:BUILD[0m][Target:'[1;32;40mjoin_int[0m']"
	$(CXX) src/join_int_join_int.o -Xlinker "-("  ../share/dev/ufs_2_0/app/ecom/elib/ecommon-lib/libellib.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/dep/plsa/libplsa_ecom.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/dep/plsa/libplsa_models.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/dep/query-kernel/libquery_kernel.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/dep/wordner-ecom/output/lib/libwordner.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/plsa-pzd/libplsa_pzd.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/region/libregion_match.a \
  ../share/dev/ufs_2_0/app/ecom/nova/kate/kate-app/output/lib/libkate-app.a \
  ../share/dev/ufs_2_0/app/ecom/nova/kate/kate-lib/libkate-lib.a \
  ../share/dev/ufs_2_0/app/ecom/nova/pfs/pfs-url-pattern/output/lib/libul-patt.a \
  ../share/dev/ufs_2_0/app/ecom/nova/thirdparty/gflags/output/lib/libgflags.a \
  ../share/dev/ufs_2_0/app/ecom/nova/thirdparty/gflags/output/lib/libgflags_nothreads.a \
  ../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/str-parser/libstr-parser.a \
  ../share/dev/ufs_2_0/app/ecom/ufs/util/libufs-util.a \
  ../share/dev/ufs_2_0/app/ecom/ufs/utility/strutil/libstrutil.a \
  ../share/dev/ufs_2_0/com/btest/googlemock/output/lib/libgmock.a \
  ../share/dev/ufs_2_0/com/btest/googlemock/output/lib/libgmock_main.a \
  ../share/dev/ufs_2_0/com/btest/gtest/output/lib/libgtest.a \
  ../share/dev/ufs_2_0/com/btest/gtest/output/lib/libgtest_main.a \
  ../share/dev/ufs_2_0/com/idlcompiler/astyle/libastyle.a \
  ../share/dev/ufs_2_0/com/idlcompiler/cxx/libskeleton.a \
  ../share/dev/ufs_2_0/com/idlcompiler/parser/libparser.a \
  ../share/dev/ufs_2_0/lib2-64/bsl/lib/libbsl.a \
  ../share/dev/ufs_2_0/lib2-64/cache/lib/libmcache.a \
  ../share/dev/ufs_2_0/lib2-64/ccode/lib/libulccode.a \
  ../share/dev/ufs_2_0/lib2-64/comm-val-recog/lib/libcomm_val_recog.a \
  ../share/dev/ufs_2_0/lib2-64/dict/lib/libuldict.a \
  ../share/dev/ufs_2_0/lib2-64/http/lib/libnewhttp.a \
  ../share/dev/ufs_2_0/lib2-64/libcrf/lib/libcrf.a \
  ../share/dev/ufs_2_0/lib2-64/max-entropy/lib/libmax_entropy.a \
  ../share/dev/ufs_2_0/lib2-64/nlp-pub/lib/libnlppub.a \
  ../share/dev/ufs_2_0/lib2-64/others-ex/lib/libullib_ex.a \
  ../share/dev/ufs_2_0/lib2-64/postag/lib/libpostag.a \
  ../share/dev/ufs_2_0/lib2-64/queryclass/libqueryclass.a \
  ../share/dev/ufs_2_0/lib2-64/rewrite/lib/librewrite.a \
  ../share/dev/ufs_2_0/lib2-64/svm/lib/liblinear_svm.a \
  ../share/dev/ufs_2_0/lib2-64/ullib/lib/libullib.a \
  ../share/dev/ufs_2_0/lib2-64/wordner/lib/libwordner.a \
  ../share/dev/ufs_2_0/lib2-64/wordrank/lib/libwordrank.a \
  ../share/dev/ufs_2_0/lib2-64/wordseg/libsegment.a \
  ../share/dev/ufs_2_0/ps/se/dict-set/libdictset.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_bml.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_containers_utils.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_var_scripting.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_var_serializer.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_var_vscript.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_vs.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbslext.a \
  ../share/dev/ufs_2_0/public/comlog-plugin/libcomlog.a \
  ../share/dev/ufs_2_0/public/comlog-plugin/output/lib/libdfsappender.a \
  ../share/dev/ufs_2_0/public/configure/libconfig.a \
  ../share/dev/ufs_2_0/public/connectpool/libconnectpool.a \
  ../share/dev/ufs_2_0/public/fileio/libfileio.a \
  ../share/dev/ufs_2_0/public/gm/galileo/libgalileo.a \
  ../share/dev/ufs_2_0/public/gm/galileo/output/lib/libzookeeper_mt.a \
  ../share/dev/ufs_2_0/public/gm/mola2/libmola.a \
  ../share/dev/ufs_2_0/public/gm/zcacheapi/lib/libzcachecommon.a \
  ../share/dev/ufs_2_0/public/gm/zcacheapi/output/lib/libzcacheapi.a \
  ../share/dev/ufs_2_0/public/gm/zcacheapi/output/lib/libzcacheapiplus.a \
  ../share/dev/ufs_2_0/public/idlcompiler/output/lib/libmcpack_idl.a \
  ../share/dev/ufs_2_0/public/kylin/output/libkylin.a \
  ../share/dev/ufs_2_0/public/kylin/output/libshare.a \
  ../share/dev/ufs_2_0/public/mcpack/libmcpack.a \
  ../share/dev/ufs_2_0/public/ns/mynet/libmynet.a \
  ../share/dev/ufs_2_0/public/nshead/libnshead.a \
  ../share/dev/ufs_2_0/public/odict/libodict.a \
  ../share/dev/ufs_2_0/public/spreg/libspreg.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_aserver.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_client.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_conf.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_galileo.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_log.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_misc.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_monitor.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_server.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libubex.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libubfw.a \
  ../share/dev/ufs_2_0/public/ubrpc/output/lib/libclient.a \
  ../share/dev/ufs_2_0/public/ubrpc/output/lib/libservlet.a \
  ../share/dev/ufs_2_0/public/uconv/libuconv.a \
  ../share/dev/ufs_2_0/public/urlparser/libnewurl.a \
  ../share/dev/ufs_2_0/quality/autotest/reportlib/cpp/libautotest.a \
  ../share/dev/ufs_2_0/st/nlp/classification/juejin-query-cls/libjuejin_query_cls.a \
  ../share/dev/ufs_2_0/st/nlp/lexparser/liblexparser.a \
  ../share/dev/ufs_2_0/sys/dpf/hadoop/hadoop-core/output/lib/native/Linux-amd64-64/libhadoop.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_date_time.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_filesystem.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_graph.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_iostreams.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_c99.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_c99f.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_c99l.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_tr1.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_tr1f.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_tr1l.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_prg_exec_monitor.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_program_options.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_python.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_random.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_regex.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_serialization.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_signals.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_system.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_test_exec_monitor.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_thread.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_unit_test_framework.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_wave.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_wserialization.a \
  ../share/dev/ufs_2_0/third-64/pcre/lib/libpcre.a \
  ../share/dev/ufs_2_0/third-64/pcre/lib/libpcrecpp.a \
  ../share/dev/ufs_2_0/third-64/pcre/lib/libpcreposix.a \
  ../share/dev/ufs_2_0/third-64/protobuf/lib/libprotobuf.a \
  ../share/dev/ufs_2_0/third-64/protobuf/lib/libprotoc.a \
  ../share/dev/ufs_2_0/third-64/tbb/lib/libtbb.a \
  ../share/dev/ufs_2_0/thirdsrc/protobuf/output/lib/libprotobuf-lite.a \
  ../share/dev/ufs_2_0/thirdsrc/protobuf/output/lib/libprotobuf.a \
  ../share/dev/ufs_2_0/thirdsrc/protobuf/output/lib/libprotoc.a \
  ../share/dev/ufs_2_0/thirdsrc/zookeeper/output/lib/libzookeeper_mt.a \
  ../share/dev/ufs_2_0/thirdsrc/zookeeper/output/lib/libzookeeper_st.a -lpthread \
  -lcrypto \
  -lrt -Xlinker "-)" -o join_int
	mkdir -p ./output/bin
	cp -f --link join_int ./output/bin

join_str:src/join_str_join_str.o
	@echo "[[1;32;40mCOMAKE:BUILD[0m][Target:'[1;32;40mjoin_str[0m']"
	$(CXX) src/join_str_join_str.o -Xlinker "-("  ../share/dev/ufs_2_0/app/ecom/elib/ecommon-lib/libellib.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/dep/plsa/libplsa_ecom.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/dep/plsa/libplsa_models.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/dep/query-kernel/libquery_kernel.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/dep/wordner-ecom/output/lib/libwordner.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/plsa-pzd/libplsa_pzd.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/region/libregion_match.a \
  ../share/dev/ufs_2_0/app/ecom/nova/kate/kate-app/output/lib/libkate-app.a \
  ../share/dev/ufs_2_0/app/ecom/nova/kate/kate-lib/libkate-lib.a \
  ../share/dev/ufs_2_0/app/ecom/nova/pfs/pfs-url-pattern/output/lib/libul-patt.a \
  ../share/dev/ufs_2_0/app/ecom/nova/thirdparty/gflags/output/lib/libgflags.a \
  ../share/dev/ufs_2_0/app/ecom/nova/thirdparty/gflags/output/lib/libgflags_nothreads.a \
  ../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/str-parser/libstr-parser.a \
  ../share/dev/ufs_2_0/app/ecom/ufs/util/libufs-util.a \
  ../share/dev/ufs_2_0/app/ecom/ufs/utility/strutil/libstrutil.a \
  ../share/dev/ufs_2_0/com/btest/googlemock/output/lib/libgmock.a \
  ../share/dev/ufs_2_0/com/btest/googlemock/output/lib/libgmock_main.a \
  ../share/dev/ufs_2_0/com/btest/gtest/output/lib/libgtest.a \
  ../share/dev/ufs_2_0/com/btest/gtest/output/lib/libgtest_main.a \
  ../share/dev/ufs_2_0/com/idlcompiler/astyle/libastyle.a \
  ../share/dev/ufs_2_0/com/idlcompiler/cxx/libskeleton.a \
  ../share/dev/ufs_2_0/com/idlcompiler/parser/libparser.a \
  ../share/dev/ufs_2_0/lib2-64/bsl/lib/libbsl.a \
  ../share/dev/ufs_2_0/lib2-64/cache/lib/libmcache.a \
  ../share/dev/ufs_2_0/lib2-64/ccode/lib/libulccode.a \
  ../share/dev/ufs_2_0/lib2-64/comm-val-recog/lib/libcomm_val_recog.a \
  ../share/dev/ufs_2_0/lib2-64/dict/lib/libuldict.a \
  ../share/dev/ufs_2_0/lib2-64/http/lib/libnewhttp.a \
  ../share/dev/ufs_2_0/lib2-64/libcrf/lib/libcrf.a \
  ../share/dev/ufs_2_0/lib2-64/max-entropy/lib/libmax_entropy.a \
  ../share/dev/ufs_2_0/lib2-64/nlp-pub/lib/libnlppub.a \
  ../share/dev/ufs_2_0/lib2-64/others-ex/lib/libullib_ex.a \
  ../share/dev/ufs_2_0/lib2-64/postag/lib/libpostag.a \
  ../share/dev/ufs_2_0/lib2-64/queryclass/libqueryclass.a \
  ../share/dev/ufs_2_0/lib2-64/rewrite/lib/librewrite.a \
  ../share/dev/ufs_2_0/lib2-64/svm/lib/liblinear_svm.a \
  ../share/dev/ufs_2_0/lib2-64/ullib/lib/libullib.a \
  ../share/dev/ufs_2_0/lib2-64/wordner/lib/libwordner.a \
  ../share/dev/ufs_2_0/lib2-64/wordrank/lib/libwordrank.a \
  ../share/dev/ufs_2_0/lib2-64/wordseg/libsegment.a \
  ../share/dev/ufs_2_0/ps/se/dict-set/libdictset.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_bml.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_containers_utils.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_var_scripting.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_var_serializer.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_var_vscript.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_vs.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbslext.a \
  ../share/dev/ufs_2_0/public/comlog-plugin/libcomlog.a \
  ../share/dev/ufs_2_0/public/comlog-plugin/output/lib/libdfsappender.a \
  ../share/dev/ufs_2_0/public/configure/libconfig.a \
  ../share/dev/ufs_2_0/public/connectpool/libconnectpool.a \
  ../share/dev/ufs_2_0/public/fileio/libfileio.a \
  ../share/dev/ufs_2_0/public/gm/galileo/libgalileo.a \
  ../share/dev/ufs_2_0/public/gm/galileo/output/lib/libzookeeper_mt.a \
  ../share/dev/ufs_2_0/public/gm/mola2/libmola.a \
  ../share/dev/ufs_2_0/public/gm/zcacheapi/lib/libzcachecommon.a \
  ../share/dev/ufs_2_0/public/gm/zcacheapi/output/lib/libzcacheapi.a \
  ../share/dev/ufs_2_0/public/gm/zcacheapi/output/lib/libzcacheapiplus.a \
  ../share/dev/ufs_2_0/public/idlcompiler/output/lib/libmcpack_idl.a \
  ../share/dev/ufs_2_0/public/kylin/output/libkylin.a \
  ../share/dev/ufs_2_0/public/kylin/output/libshare.a \
  ../share/dev/ufs_2_0/public/mcpack/libmcpack.a \
  ../share/dev/ufs_2_0/public/ns/mynet/libmynet.a \
  ../share/dev/ufs_2_0/public/nshead/libnshead.a \
  ../share/dev/ufs_2_0/public/odict/libodict.a \
  ../share/dev/ufs_2_0/public/spreg/libspreg.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_aserver.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_client.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_conf.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_galileo.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_log.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_misc.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_monitor.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_server.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libubex.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libubfw.a \
  ../share/dev/ufs_2_0/public/ubrpc/output/lib/libclient.a \
  ../share/dev/ufs_2_0/public/ubrpc/output/lib/libservlet.a \
  ../share/dev/ufs_2_0/public/uconv/libuconv.a \
  ../share/dev/ufs_2_0/public/urlparser/libnewurl.a \
  ../share/dev/ufs_2_0/quality/autotest/reportlib/cpp/libautotest.a \
  ../share/dev/ufs_2_0/st/nlp/classification/juejin-query-cls/libjuejin_query_cls.a \
  ../share/dev/ufs_2_0/st/nlp/lexparser/liblexparser.a \
  ../share/dev/ufs_2_0/sys/dpf/hadoop/hadoop-core/output/lib/native/Linux-amd64-64/libhadoop.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_date_time.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_filesystem.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_graph.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_iostreams.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_c99.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_c99f.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_c99l.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_tr1.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_tr1f.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_tr1l.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_prg_exec_monitor.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_program_options.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_python.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_random.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_regex.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_serialization.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_signals.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_system.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_test_exec_monitor.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_thread.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_unit_test_framework.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_wave.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_wserialization.a \
  ../share/dev/ufs_2_0/third-64/pcre/lib/libpcre.a \
  ../share/dev/ufs_2_0/third-64/pcre/lib/libpcrecpp.a \
  ../share/dev/ufs_2_0/third-64/pcre/lib/libpcreposix.a \
  ../share/dev/ufs_2_0/third-64/protobuf/lib/libprotobuf.a \
  ../share/dev/ufs_2_0/third-64/protobuf/lib/libprotoc.a \
  ../share/dev/ufs_2_0/third-64/tbb/lib/libtbb.a \
  ../share/dev/ufs_2_0/thirdsrc/protobuf/output/lib/libprotobuf-lite.a \
  ../share/dev/ufs_2_0/thirdsrc/protobuf/output/lib/libprotobuf.a \
  ../share/dev/ufs_2_0/thirdsrc/protobuf/output/lib/libprotoc.a \
  ../share/dev/ufs_2_0/thirdsrc/zookeeper/output/lib/libzookeeper_mt.a \
  ../share/dev/ufs_2_0/thirdsrc/zookeeper/output/lib/libzookeeper_st.a -lpthread \
  -lcrypto \
  -lrt -Xlinker "-)" -o join_str
	mkdir -p ./output/bin
	cp -f --link join_str ./output/bin

word_freq:src/word_freq_word_freq.o
	@echo "[[1;32;40mCOMAKE:BUILD[0m][Target:'[1;32;40mword_freq[0m']"
	$(CXX) src/word_freq_word_freq.o -Xlinker "-("  ../share/dev/ufs_2_0/app/ecom/elib/ecommon-lib/libellib.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/dep/plsa/libplsa_ecom.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/dep/plsa/libplsa_models.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/dep/query-kernel/libquery_kernel.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/dep/wordner-ecom/output/lib/libwordner.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/plsa-pzd/libplsa_pzd.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/region/libregion_match.a \
  ../share/dev/ufs_2_0/app/ecom/nova/kate/kate-app/output/lib/libkate-app.a \
  ../share/dev/ufs_2_0/app/ecom/nova/kate/kate-lib/libkate-lib.a \
  ../share/dev/ufs_2_0/app/ecom/nova/pfs/pfs-url-pattern/output/lib/libul-patt.a \
  ../share/dev/ufs_2_0/app/ecom/nova/thirdparty/gflags/output/lib/libgflags.a \
  ../share/dev/ufs_2_0/app/ecom/nova/thirdparty/gflags/output/lib/libgflags_nothreads.a \
  ../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/str-parser/libstr-parser.a \
  ../share/dev/ufs_2_0/app/ecom/ufs/util/libufs-util.a \
  ../share/dev/ufs_2_0/app/ecom/ufs/utility/strutil/libstrutil.a \
  ../share/dev/ufs_2_0/com/btest/googlemock/output/lib/libgmock.a \
  ../share/dev/ufs_2_0/com/btest/googlemock/output/lib/libgmock_main.a \
  ../share/dev/ufs_2_0/com/btest/gtest/output/lib/libgtest.a \
  ../share/dev/ufs_2_0/com/btest/gtest/output/lib/libgtest_main.a \
  ../share/dev/ufs_2_0/com/idlcompiler/astyle/libastyle.a \
  ../share/dev/ufs_2_0/com/idlcompiler/cxx/libskeleton.a \
  ../share/dev/ufs_2_0/com/idlcompiler/parser/libparser.a \
  ../share/dev/ufs_2_0/lib2-64/bsl/lib/libbsl.a \
  ../share/dev/ufs_2_0/lib2-64/cache/lib/libmcache.a \
  ../share/dev/ufs_2_0/lib2-64/ccode/lib/libulccode.a \
  ../share/dev/ufs_2_0/lib2-64/comm-val-recog/lib/libcomm_val_recog.a \
  ../share/dev/ufs_2_0/lib2-64/dict/lib/libuldict.a \
  ../share/dev/ufs_2_0/lib2-64/http/lib/libnewhttp.a \
  ../share/dev/ufs_2_0/lib2-64/libcrf/lib/libcrf.a \
  ../share/dev/ufs_2_0/lib2-64/max-entropy/lib/libmax_entropy.a \
  ../share/dev/ufs_2_0/lib2-64/nlp-pub/lib/libnlppub.a \
  ../share/dev/ufs_2_0/lib2-64/others-ex/lib/libullib_ex.a \
  ../share/dev/ufs_2_0/lib2-64/postag/lib/libpostag.a \
  ../share/dev/ufs_2_0/lib2-64/queryclass/libqueryclass.a \
  ../share/dev/ufs_2_0/lib2-64/rewrite/lib/librewrite.a \
  ../share/dev/ufs_2_0/lib2-64/svm/lib/liblinear_svm.a \
  ../share/dev/ufs_2_0/lib2-64/ullib/lib/libullib.a \
  ../share/dev/ufs_2_0/lib2-64/wordner/lib/libwordner.a \
  ../share/dev/ufs_2_0/lib2-64/wordrank/lib/libwordrank.a \
  ../share/dev/ufs_2_0/lib2-64/wordseg/libsegment.a \
  ../share/dev/ufs_2_0/ps/se/dict-set/libdictset.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_bml.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_containers_utils.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_var_scripting.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_var_serializer.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_var_vscript.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_vs.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbslext.a \
  ../share/dev/ufs_2_0/public/comlog-plugin/libcomlog.a \
  ../share/dev/ufs_2_0/public/comlog-plugin/output/lib/libdfsappender.a \
  ../share/dev/ufs_2_0/public/configure/libconfig.a \
  ../share/dev/ufs_2_0/public/connectpool/libconnectpool.a \
  ../share/dev/ufs_2_0/public/fileio/libfileio.a \
  ../share/dev/ufs_2_0/public/gm/galileo/libgalileo.a \
  ../share/dev/ufs_2_0/public/gm/galileo/output/lib/libzookeeper_mt.a \
  ../share/dev/ufs_2_0/public/gm/mola2/libmola.a \
  ../share/dev/ufs_2_0/public/gm/zcacheapi/lib/libzcachecommon.a \
  ../share/dev/ufs_2_0/public/gm/zcacheapi/output/lib/libzcacheapi.a \
  ../share/dev/ufs_2_0/public/gm/zcacheapi/output/lib/libzcacheapiplus.a \
  ../share/dev/ufs_2_0/public/idlcompiler/output/lib/libmcpack_idl.a \
  ../share/dev/ufs_2_0/public/kylin/output/libkylin.a \
  ../share/dev/ufs_2_0/public/kylin/output/libshare.a \
  ../share/dev/ufs_2_0/public/mcpack/libmcpack.a \
  ../share/dev/ufs_2_0/public/ns/mynet/libmynet.a \
  ../share/dev/ufs_2_0/public/nshead/libnshead.a \
  ../share/dev/ufs_2_0/public/odict/libodict.a \
  ../share/dev/ufs_2_0/public/spreg/libspreg.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_aserver.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_client.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_conf.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_galileo.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_log.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_misc.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_monitor.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_server.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libubex.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libubfw.a \
  ../share/dev/ufs_2_0/public/ubrpc/output/lib/libclient.a \
  ../share/dev/ufs_2_0/public/ubrpc/output/lib/libservlet.a \
  ../share/dev/ufs_2_0/public/uconv/libuconv.a \
  ../share/dev/ufs_2_0/public/urlparser/libnewurl.a \
  ../share/dev/ufs_2_0/quality/autotest/reportlib/cpp/libautotest.a \
  ../share/dev/ufs_2_0/st/nlp/classification/juejin-query-cls/libjuejin_query_cls.a \
  ../share/dev/ufs_2_0/st/nlp/lexparser/liblexparser.a \
  ../share/dev/ufs_2_0/sys/dpf/hadoop/hadoop-core/output/lib/native/Linux-amd64-64/libhadoop.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_date_time.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_filesystem.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_graph.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_iostreams.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_c99.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_c99f.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_c99l.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_tr1.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_tr1f.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_tr1l.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_prg_exec_monitor.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_program_options.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_python.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_random.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_regex.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_serialization.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_signals.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_system.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_test_exec_monitor.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_thread.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_unit_test_framework.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_wave.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_wserialization.a \
  ../share/dev/ufs_2_0/third-64/pcre/lib/libpcre.a \
  ../share/dev/ufs_2_0/third-64/pcre/lib/libpcrecpp.a \
  ../share/dev/ufs_2_0/third-64/pcre/lib/libpcreposix.a \
  ../share/dev/ufs_2_0/third-64/protobuf/lib/libprotobuf.a \
  ../share/dev/ufs_2_0/third-64/protobuf/lib/libprotoc.a \
  ../share/dev/ufs_2_0/third-64/tbb/lib/libtbb.a \
  ../share/dev/ufs_2_0/thirdsrc/protobuf/output/lib/libprotobuf-lite.a \
  ../share/dev/ufs_2_0/thirdsrc/protobuf/output/lib/libprotobuf.a \
  ../share/dev/ufs_2_0/thirdsrc/protobuf/output/lib/libprotoc.a \
  ../share/dev/ufs_2_0/thirdsrc/zookeeper/output/lib/libzookeeper_mt.a \
  ../share/dev/ufs_2_0/thirdsrc/zookeeper/output/lib/libzookeeper_st.a -lpthread \
  -lcrypto \
  -lrt -Xlinker "-)" -o word_freq
	mkdir -p ./output/bin
	cp -f --link word_freq ./output/bin

gen_dmdict:src/gen_dmdict_gen_dmdict.o
	@echo "[[1;32;40mCOMAKE:BUILD[0m][Target:'[1;32;40mgen_dmdict[0m']"
	$(CXX) src/gen_dmdict_gen_dmdict.o -Xlinker "-("  ../share/dev/ufs_2_0/app/ecom/elib/ecommon-lib/libellib.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/dep/plsa/libplsa_ecom.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/dep/plsa/libplsa_models.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/dep/query-kernel/libquery_kernel.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/dep/wordner-ecom/output/lib/libwordner.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/plsa-pzd/libplsa_pzd.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/region/libregion_match.a \
  ../share/dev/ufs_2_0/app/ecom/nova/kate/kate-app/output/lib/libkate-app.a \
  ../share/dev/ufs_2_0/app/ecom/nova/kate/kate-lib/libkate-lib.a \
  ../share/dev/ufs_2_0/app/ecom/nova/pfs/pfs-url-pattern/output/lib/libul-patt.a \
  ../share/dev/ufs_2_0/app/ecom/nova/thirdparty/gflags/output/lib/libgflags.a \
  ../share/dev/ufs_2_0/app/ecom/nova/thirdparty/gflags/output/lib/libgflags_nothreads.a \
  ../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/str-parser/libstr-parser.a \
  ../share/dev/ufs_2_0/app/ecom/ufs/util/libufs-util.a \
  ../share/dev/ufs_2_0/app/ecom/ufs/utility/strutil/libstrutil.a \
  ../share/dev/ufs_2_0/com/btest/googlemock/output/lib/libgmock.a \
  ../share/dev/ufs_2_0/com/btest/googlemock/output/lib/libgmock_main.a \
  ../share/dev/ufs_2_0/com/btest/gtest/output/lib/libgtest.a \
  ../share/dev/ufs_2_0/com/btest/gtest/output/lib/libgtest_main.a \
  ../share/dev/ufs_2_0/com/idlcompiler/astyle/libastyle.a \
  ../share/dev/ufs_2_0/com/idlcompiler/cxx/libskeleton.a \
  ../share/dev/ufs_2_0/com/idlcompiler/parser/libparser.a \
  ../share/dev/ufs_2_0/lib2-64/bsl/lib/libbsl.a \
  ../share/dev/ufs_2_0/lib2-64/cache/lib/libmcache.a \
  ../share/dev/ufs_2_0/lib2-64/ccode/lib/libulccode.a \
  ../share/dev/ufs_2_0/lib2-64/comm-val-recog/lib/libcomm_val_recog.a \
  ../share/dev/ufs_2_0/lib2-64/dict/lib/libuldict.a \
  ../share/dev/ufs_2_0/lib2-64/http/lib/libnewhttp.a \
  ../share/dev/ufs_2_0/lib2-64/libcrf/lib/libcrf.a \
  ../share/dev/ufs_2_0/lib2-64/max-entropy/lib/libmax_entropy.a \
  ../share/dev/ufs_2_0/lib2-64/nlp-pub/lib/libnlppub.a \
  ../share/dev/ufs_2_0/lib2-64/others-ex/lib/libullib_ex.a \
  ../share/dev/ufs_2_0/lib2-64/postag/lib/libpostag.a \
  ../share/dev/ufs_2_0/lib2-64/queryclass/libqueryclass.a \
  ../share/dev/ufs_2_0/lib2-64/rewrite/lib/librewrite.a \
  ../share/dev/ufs_2_0/lib2-64/svm/lib/liblinear_svm.a \
  ../share/dev/ufs_2_0/lib2-64/ullib/lib/libullib.a \
  ../share/dev/ufs_2_0/lib2-64/wordner/lib/libwordner.a \
  ../share/dev/ufs_2_0/lib2-64/wordrank/lib/libwordrank.a \
  ../share/dev/ufs_2_0/lib2-64/wordseg/libsegment.a \
  ../share/dev/ufs_2_0/ps/se/dict-set/libdictset.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_bml.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_containers_utils.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_var_scripting.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_var_serializer.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_var_vscript.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_vs.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbslext.a \
  ../share/dev/ufs_2_0/public/comlog-plugin/libcomlog.a \
  ../share/dev/ufs_2_0/public/comlog-plugin/output/lib/libdfsappender.a \
  ../share/dev/ufs_2_0/public/configure/libconfig.a \
  ../share/dev/ufs_2_0/public/connectpool/libconnectpool.a \
  ../share/dev/ufs_2_0/public/fileio/libfileio.a \
  ../share/dev/ufs_2_0/public/gm/galileo/libgalileo.a \
  ../share/dev/ufs_2_0/public/gm/galileo/output/lib/libzookeeper_mt.a \
  ../share/dev/ufs_2_0/public/gm/mola2/libmola.a \
  ../share/dev/ufs_2_0/public/gm/zcacheapi/lib/libzcachecommon.a \
  ../share/dev/ufs_2_0/public/gm/zcacheapi/output/lib/libzcacheapi.a \
  ../share/dev/ufs_2_0/public/gm/zcacheapi/output/lib/libzcacheapiplus.a \
  ../share/dev/ufs_2_0/public/idlcompiler/output/lib/libmcpack_idl.a \
  ../share/dev/ufs_2_0/public/kylin/output/libkylin.a \
  ../share/dev/ufs_2_0/public/kylin/output/libshare.a \
  ../share/dev/ufs_2_0/public/mcpack/libmcpack.a \
  ../share/dev/ufs_2_0/public/ns/mynet/libmynet.a \
  ../share/dev/ufs_2_0/public/nshead/libnshead.a \
  ../share/dev/ufs_2_0/public/odict/libodict.a \
  ../share/dev/ufs_2_0/public/spreg/libspreg.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_aserver.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_client.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_conf.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_galileo.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_log.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_misc.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_monitor.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_server.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libubex.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libubfw.a \
  ../share/dev/ufs_2_0/public/ubrpc/output/lib/libclient.a \
  ../share/dev/ufs_2_0/public/ubrpc/output/lib/libservlet.a \
  ../share/dev/ufs_2_0/public/uconv/libuconv.a \
  ../share/dev/ufs_2_0/public/urlparser/libnewurl.a \
  ../share/dev/ufs_2_0/quality/autotest/reportlib/cpp/libautotest.a \
  ../share/dev/ufs_2_0/st/nlp/classification/juejin-query-cls/libjuejin_query_cls.a \
  ../share/dev/ufs_2_0/st/nlp/lexparser/liblexparser.a \
  ../share/dev/ufs_2_0/sys/dpf/hadoop/hadoop-core/output/lib/native/Linux-amd64-64/libhadoop.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_date_time.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_filesystem.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_graph.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_iostreams.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_c99.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_c99f.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_c99l.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_tr1.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_tr1f.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_tr1l.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_prg_exec_monitor.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_program_options.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_python.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_random.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_regex.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_serialization.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_signals.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_system.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_test_exec_monitor.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_thread.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_unit_test_framework.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_wave.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_wserialization.a \
  ../share/dev/ufs_2_0/third-64/pcre/lib/libpcre.a \
  ../share/dev/ufs_2_0/third-64/pcre/lib/libpcrecpp.a \
  ../share/dev/ufs_2_0/third-64/pcre/lib/libpcreposix.a \
  ../share/dev/ufs_2_0/third-64/protobuf/lib/libprotobuf.a \
  ../share/dev/ufs_2_0/third-64/protobuf/lib/libprotoc.a \
  ../share/dev/ufs_2_0/third-64/tbb/lib/libtbb.a \
  ../share/dev/ufs_2_0/thirdsrc/protobuf/output/lib/libprotobuf-lite.a \
  ../share/dev/ufs_2_0/thirdsrc/protobuf/output/lib/libprotobuf.a \
  ../share/dev/ufs_2_0/thirdsrc/protobuf/output/lib/libprotoc.a \
  ../share/dev/ufs_2_0/thirdsrc/zookeeper/output/lib/libzookeeper_mt.a \
  ../share/dev/ufs_2_0/thirdsrc/zookeeper/output/lib/libzookeeper_st.a -lpthread \
  -lcrypto \
  -lrt -Xlinker "-)" -o gen_dmdict
	mkdir -p ./output/bin
	cp -f --link gen_dmdict ./output/bin

get_domain:src/get_domain_get_domain.o
	@echo "[[1;32;40mCOMAKE:BUILD[0m][Target:'[1;32;40mget_domain[0m']"
	$(CXX) src/get_domain_get_domain.o -Xlinker "-("  ../share/dev/ufs_2_0/app/ecom/elib/ecommon-lib/libellib.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/dep/plsa/libplsa_ecom.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/dep/plsa/libplsa_models.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/dep/query-kernel/libquery_kernel.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/dep/wordner-ecom/output/lib/libwordner.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/plsa-pzd/libplsa_pzd.a \
  ../share/dev/ufs_2_0/app/ecom/fcr/region/libregion_match.a \
  ../share/dev/ufs_2_0/app/ecom/nova/kate/kate-app/output/lib/libkate-app.a \
  ../share/dev/ufs_2_0/app/ecom/nova/kate/kate-lib/libkate-lib.a \
  ../share/dev/ufs_2_0/app/ecom/nova/pfs/pfs-url-pattern/output/lib/libul-patt.a \
  ../share/dev/ufs_2_0/app/ecom/nova/thirdparty/gflags/output/lib/libgflags.a \
  ../share/dev/ufs_2_0/app/ecom/nova/thirdparty/gflags/output/lib/libgflags_nothreads.a \
  ../share/dev/ufs_2_0/app/ecom/nova/tools/utlib/str-parser/libstr-parser.a \
  ../share/dev/ufs_2_0/app/ecom/ufs/util/libufs-util.a \
  ../share/dev/ufs_2_0/app/ecom/ufs/utility/strutil/libstrutil.a \
  ../share/dev/ufs_2_0/com/btest/googlemock/output/lib/libgmock.a \
  ../share/dev/ufs_2_0/com/btest/googlemock/output/lib/libgmock_main.a \
  ../share/dev/ufs_2_0/com/btest/gtest/output/lib/libgtest.a \
  ../share/dev/ufs_2_0/com/btest/gtest/output/lib/libgtest_main.a \
  ../share/dev/ufs_2_0/com/idlcompiler/astyle/libastyle.a \
  ../share/dev/ufs_2_0/com/idlcompiler/cxx/libskeleton.a \
  ../share/dev/ufs_2_0/com/idlcompiler/parser/libparser.a \
  ../share/dev/ufs_2_0/lib2-64/bsl/lib/libbsl.a \
  ../share/dev/ufs_2_0/lib2-64/cache/lib/libmcache.a \
  ../share/dev/ufs_2_0/lib2-64/ccode/lib/libulccode.a \
  ../share/dev/ufs_2_0/lib2-64/comm-val-recog/lib/libcomm_val_recog.a \
  ../share/dev/ufs_2_0/lib2-64/dict/lib/libuldict.a \
  ../share/dev/ufs_2_0/lib2-64/http/lib/libnewhttp.a \
  ../share/dev/ufs_2_0/lib2-64/libcrf/lib/libcrf.a \
  ../share/dev/ufs_2_0/lib2-64/max-entropy/lib/libmax_entropy.a \
  ../share/dev/ufs_2_0/lib2-64/nlp-pub/lib/libnlppub.a \
  ../share/dev/ufs_2_0/lib2-64/others-ex/lib/libullib_ex.a \
  ../share/dev/ufs_2_0/lib2-64/postag/lib/libpostag.a \
  ../share/dev/ufs_2_0/lib2-64/queryclass/libqueryclass.a \
  ../share/dev/ufs_2_0/lib2-64/rewrite/lib/librewrite.a \
  ../share/dev/ufs_2_0/lib2-64/svm/lib/liblinear_svm.a \
  ../share/dev/ufs_2_0/lib2-64/ullib/lib/libullib.a \
  ../share/dev/ufs_2_0/lib2-64/wordner/lib/libwordner.a \
  ../share/dev/ufs_2_0/lib2-64/wordrank/lib/libwordrank.a \
  ../share/dev/ufs_2_0/lib2-64/wordseg/libsegment.a \
  ../share/dev/ufs_2_0/ps/se/dict-set/libdictset.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_bml.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_containers_utils.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_var_scripting.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_var_serializer.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_var_vscript.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbsl_vs.a \
  ../share/dev/ufs_2_0/public/bslext/output/lib/libbslext.a \
  ../share/dev/ufs_2_0/public/comlog-plugin/libcomlog.a \
  ../share/dev/ufs_2_0/public/comlog-plugin/output/lib/libdfsappender.a \
  ../share/dev/ufs_2_0/public/configure/libconfig.a \
  ../share/dev/ufs_2_0/public/connectpool/libconnectpool.a \
  ../share/dev/ufs_2_0/public/fileio/libfileio.a \
  ../share/dev/ufs_2_0/public/gm/galileo/libgalileo.a \
  ../share/dev/ufs_2_0/public/gm/galileo/output/lib/libzookeeper_mt.a \
  ../share/dev/ufs_2_0/public/gm/mola2/libmola.a \
  ../share/dev/ufs_2_0/public/gm/zcacheapi/lib/libzcachecommon.a \
  ../share/dev/ufs_2_0/public/gm/zcacheapi/output/lib/libzcacheapi.a \
  ../share/dev/ufs_2_0/public/gm/zcacheapi/output/lib/libzcacheapiplus.a \
  ../share/dev/ufs_2_0/public/idlcompiler/output/lib/libmcpack_idl.a \
  ../share/dev/ufs_2_0/public/kylin/output/libkylin.a \
  ../share/dev/ufs_2_0/public/kylin/output/libshare.a \
  ../share/dev/ufs_2_0/public/mcpack/libmcpack.a \
  ../share/dev/ufs_2_0/public/ns/mynet/libmynet.a \
  ../share/dev/ufs_2_0/public/nshead/libnshead.a \
  ../share/dev/ufs_2_0/public/odict/libodict.a \
  ../share/dev/ufs_2_0/public/spreg/libspreg.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_aserver.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_client.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_conf.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_galileo.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_log.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_misc.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_monitor.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libub_server.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libubex.a \
  ../share/dev/ufs_2_0/public/ub/output/lib/libubfw.a \
  ../share/dev/ufs_2_0/public/ubrpc/output/lib/libclient.a \
  ../share/dev/ufs_2_0/public/ubrpc/output/lib/libservlet.a \
  ../share/dev/ufs_2_0/public/uconv/libuconv.a \
  ../share/dev/ufs_2_0/public/urlparser/libnewurl.a \
  ../share/dev/ufs_2_0/quality/autotest/reportlib/cpp/libautotest.a \
  ../share/dev/ufs_2_0/st/nlp/classification/juejin-query-cls/libjuejin_query_cls.a \
  ../share/dev/ufs_2_0/st/nlp/lexparser/liblexparser.a \
  ../share/dev/ufs_2_0/sys/dpf/hadoop/hadoop-core/output/lib/native/Linux-amd64-64/libhadoop.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_date_time.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_filesystem.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_graph.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_iostreams.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_c99.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_c99f.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_c99l.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_tr1.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_tr1f.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_math_tr1l.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_prg_exec_monitor.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_program_options.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_python.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_random.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_regex.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_serialization.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_signals.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_system.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_test_exec_monitor.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_thread.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_unit_test_framework.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_wave.a \
  ../share/dev/ufs_2_0/third-64/boost/lib/libboost_wserialization.a \
  ../share/dev/ufs_2_0/third-64/pcre/lib/libpcre.a \
  ../share/dev/ufs_2_0/third-64/pcre/lib/libpcrecpp.a \
  ../share/dev/ufs_2_0/third-64/pcre/lib/libpcreposix.a \
  ../share/dev/ufs_2_0/third-64/protobuf/lib/libprotobuf.a \
  ../share/dev/ufs_2_0/third-64/protobuf/lib/libprotoc.a \
  ../share/dev/ufs_2_0/third-64/tbb/lib/libtbb.a \
  ../share/dev/ufs_2_0/thirdsrc/protobuf/output/lib/libprotobuf-lite.a \
  ../share/dev/ufs_2_0/thirdsrc/protobuf/output/lib/libprotobuf.a \
  ../share/dev/ufs_2_0/thirdsrc/protobuf/output/lib/libprotoc.a \
  ../share/dev/ufs_2_0/thirdsrc/zookeeper/output/lib/libzookeeper_mt.a \
  ../share/dev/ufs_2_0/thirdsrc/zookeeper/output/lib/libzookeeper_st.a -lpthread \
  -lcrypto \
  -lrt -Xlinker "-)" -o get_domain
	mkdir -p ./output/bin
	cp -f --link get_domain ./output/bin

src/de_baiduid_de_baiduid.o:src/de_baiduid.cpp \
  include/de_baiduid.h
	@echo "[[1;32;40mCOMAKE:BUILD[0m][Target:'[1;32;40msrc/de_baiduid_de_baiduid.o[0m']"
	$(CXX) -c $(INCPATH) $(DEP_INCPATH) $(CPPFLAGS) $(CXXFLAGS)  -o src/de_baiduid_de_baiduid.o src/de_baiduid.cpp

src/mod_cookie_mod_cookie.o:src/mod_cookie.cpp
	@echo "[[1;32;40mCOMAKE:BUILD[0m][Target:'[1;32;40msrc/mod_cookie_mod_cookie.o[0m']"
	$(CXX) -c $(INCPATH) $(DEP_INCPATH) $(CPPFLAGS) $(CXXFLAGS)  -o src/mod_cookie_mod_cookie.o src/mod_cookie.cpp

src/join_int_join_int.o:src/join_int.cpp
	@echo "[[1;32;40mCOMAKE:BUILD[0m][Target:'[1;32;40msrc/join_int_join_int.o[0m']"
	$(CXX) -c $(INCPATH) $(DEP_INCPATH) $(CPPFLAGS) $(CXXFLAGS)  -o src/join_int_join_int.o src/join_int.cpp

src/join_str_join_str.o:src/join_str.cpp
	@echo "[[1;32;40mCOMAKE:BUILD[0m][Target:'[1;32;40msrc/join_str_join_str.o[0m']"
	$(CXX) -c $(INCPATH) $(DEP_INCPATH) $(CPPFLAGS) $(CXXFLAGS)  -o src/join_str_join_str.o src/join_str.cpp

src/word_freq_word_freq.o:src/word_freq.cpp
	@echo "[[1;32;40mCOMAKE:BUILD[0m][Target:'[1;32;40msrc/word_freq_word_freq.o[0m']"
	$(CXX) -c $(INCPATH) $(DEP_INCPATH) $(CPPFLAGS) $(CXXFLAGS)  -o src/word_freq_word_freq.o src/word_freq.cpp

src/gen_dmdict_gen_dmdict.o:src/gen_dmdict.cpp
	@echo "[[1;32;40mCOMAKE:BUILD[0m][Target:'[1;32;40msrc/gen_dmdict_gen_dmdict.o[0m']"
	$(CXX) -c $(INCPATH) $(DEP_INCPATH) $(CPPFLAGS) $(CXXFLAGS)  -o src/gen_dmdict_gen_dmdict.o src/gen_dmdict.cpp

src/get_domain_get_domain.o:src/get_domain.cpp
	@echo "[[1;32;40mCOMAKE:BUILD[0m][Target:'[1;32;40msrc/get_domain_get_domain.o[0m']"
	$(CXX) -c $(INCPATH) $(DEP_INCPATH) $(CPPFLAGS) $(CXXFLAGS)  -o src/get_domain_get_domain.o src/get_domain.cpp

endif #ifeq ($(shell uname -m),x86_64)


