#!/bin/sh

files=$(ls | grep .vhd)

for file in $files; do
    echo "verify $file ... "
    ghdl -s $file
    ghdl -a $file
done

rm -f *.o *.cf
