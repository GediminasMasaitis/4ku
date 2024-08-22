#!/bin/sh
T=`mktemp`
tail -c +150 "$0"|lzma -d|g++ -xc++ -O3 -march=native -pthread -std=c++20 - -o /dev/fd/1>$T
chmod +x $T
(sleep 3;rm $T)&exec $T
