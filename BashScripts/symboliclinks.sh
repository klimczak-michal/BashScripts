#!/bin/bash

#For directory tree, create copy in which
#all links point to the same files in orignal directory

if [ $# != 2 ]
then
  echo "ilosc argumentow inna niz dwa"
  exit 1
fi

if [ ! -d $1 ]
then
  echo "1 argument nie jest katalogiem"
  exit 2
fi

if [ ! -d $2 ]
   then
mkdir $2

for plik in `ls $1`
do
    ln -s `readlink -e $1/$plik` `readlink -e  $2/$plik`
done
fi