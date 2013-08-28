#!/bin/sh
path="/cygdrive/c/opt/precert/MILLIMAN_RULES/DENY/DENY_1_53/"
old="ED13"
a=0

while [ $a -lt 52 ];do

if [ -e "$path""ED$a.xml" ]
then

echo "starting: ""$path""ED$a.xml"
mv "$path""ED$a.xml" tmp.txt
echo "file ED$a.xml moved to tmp.txt."
sed "s/$old/ED$a/" < 'tmp.txt' > 'test.fil'
mv test.fil "$path""ED$a.xml"
echo "completed move "
echo $a >>test.fil
cp /dev/null test.fil
cp /dev/null tmp.txt
echo "completed ED$a.xml"
else
echo "file not found"
fi
a=`expr $a + 1` 
  
done

