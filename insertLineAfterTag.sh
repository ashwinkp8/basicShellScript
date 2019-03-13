#!/bin/bash

# set -x
fileName=$1
textToInsert="<ci> <id>$2</id> </ci>"
echo $#
echo $0
echo $1
echo $2


if [[ $# -ne 2 ]]
then
    echo "usage $0 <fileName> <id>"
    exit 1
fi

if [[ -z ${fileName} ]]
then
    echo "file ${fileName} does not exist"
    exit 1
fi 

 
lineNum=`grep -n "<\<selectedCIs\>>"  ${fileName} | cut -d":" -f1`
echo "found at line #${lineNum}"
lineNum=`expr ${lineNum} + 1`
echo "Will insert in line #${lineNum}"
sed -i "${lineNum}i${textToInsert}" ${fileName}
