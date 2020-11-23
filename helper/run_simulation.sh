#!/bin/sh

files=$(ls | grep .vhd)
tb=$(ls | grep _tb.vhd | cut -f 1 -d '.' | tr [:upper:] [:lower:])

for file in $files; do
    echo "analyze $file ... "
    ghdl -a --std=08 $file
done

echo "elaborate $tb ... "
ghdl -e --std=08 $tb

echo "run simulation $tb"
ghdl -r $tb --vcd=simulation.vcd --stop-time=200ns

rm -f *.o *.cf
rm -f $tb
