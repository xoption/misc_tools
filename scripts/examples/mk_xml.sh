#!/bin/sh

path="/cygdrive/c/opt/precert/MILLIMAN_RULES/DENY/"
path2="/cygdrive/c/opt/precert/MILLIMAN_RULES/DENY/DENY_1_53/"
path3="/cygdrive/c/opt/scripts/"
a=0
##creates ED#.xml file from OR.xml
while [ $a -lt 52 ]
do
cp "$path""OR.xml" "$path2""ED$a.xml"
echo "created: "$path2""ED$a.xml""

a=`expr $a + 1` 
  echo $a
done
