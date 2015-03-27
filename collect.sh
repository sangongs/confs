#!/bin/sh

if [ $# -ge 1 ]
then
    maps="$@"
else
    maps=./install.map
fi

function collect_map()
{
    basedir=`dirname $1`
    while read inst git
    do
        cp -f `eval echo $inst` $basedir/$git
    done < $1
}

for map in $maps
do
    collect_map $map
done
