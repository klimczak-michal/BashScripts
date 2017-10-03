#!/bin/bash

# In directory tree find subdirectories which have 2-4 subdirectiories:
# - user has right to write
# - group OR others have right to write
# - group OR others DON'T have right to execute

if [ $# != 1 ]
then
  echo "ilosc argumentow inna niz dwa"
  exit 1
fi

if [ ! -d $1 ]
then
  echo "1 argument nie jest katalogiem"
  exit 2
fi

dowkatmin=$((2+1))
dowkarmax=$((2+5))

sciezka=`readlink -e $1`

find $sciezka -type d -links +$dowkatmin -links -$dowkarmax -perm -200 \( -perm -020 -or -perm -002 \) \( ! -perm -010 -or ! -perm -001 \) -print