#!/bin/sh
sum=0
u=0
for i in $*
do
u=`expr $u + 1`
sum=`expr $sum + $i`
done
if [[ u > 0 ]]; then
avg=`expr $sum / $u`
echo Average = $avg, Sum = $sum, U = $u
fi;
