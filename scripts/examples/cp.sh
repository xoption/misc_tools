#!/bin/sh

path="76-212/OR/"
path2="76-212/"
a=78

while [ $a -lt 212 ]
do
if [ -e "$path""AD$a.xml" ]
then
echo "file AD$a.xml found."
cp OR.xml "$path2""AD$a.xml"
else
echo "file not found"
fi 
a=`expr $a + 1` 
  echo $a
done
