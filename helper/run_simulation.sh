#!/bin/sh

files=$(ls | grep .vhd)
tb=$(ls | grep _tb.vhd | cut -f 1 -d '.' | tr [:upper:] [:lower:])

for file in $files; do
    echo "analyze $file ... "
    ghdl -a $file
done

echo "elaborate $tb ... "
ghdl -e $tb

echo "run simulation $tb"
ghdl -r $tb --vcd=simulation.vcd
gtkwave simulation.vcd

rm -f *.o *.cf simulation.vcd
rm -f $tb
