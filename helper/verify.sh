#!/bin/sh

files=$(ls | grep .vhd)

for file in $files; do
    echo "verify $file ... "
    ghdl -s --std=08 $file
    ghdl -a --std=08 $file
done

rm -f *.o *.cf
