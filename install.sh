#!/bin/sh

if [ $# -ge 1 ]
then
    maps="$@"
else
    maps=./install.map
fi

function install_map()
{
    basedir=`dirname $1`
    while read inst git
    do
        cp -f $basedir/$git `eval echo $inst`
    done < $1
}

for map in $maps
do
    install_map $map
done
