#!/bin/bash

for i in {1..4}
do
  cp template.xml file$i.xml
  echo "Created New DTF file$i.xml"
  entry=`awk NR==$i dates.lst` 
  echo $entry
  id=`echo $entry | awk '{print $1}'`
  echo $id
  sed -i s/ID/$id/g file$i.xml
  sD=`echo $entry | awk '{print $2}'`
  echo $sD
  sed -i s/SDATE/$sD/g file$i.xml
  dD=`echo $entry | awk '{print $3}'`
  echo $dD
  sed -i s/EDATE/$dD/g file$i.xml
echo "========================================="
done

