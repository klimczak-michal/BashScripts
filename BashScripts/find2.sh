#!/bin/bash

#In directory tree find file with the same names, list with formatting:
#"nazwa pliku: po³o¿enie 1., 2., ..."
#"file name: path1, path2, ..."

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

sciezka=`readlink -e $1`
find $sciezka -type f -printf '%f %p\n' | sort -d |   
{
read Nazwa1 Katalog1
PomN=$Nazwa1
Wynik="$Nazwa1 : "
while read Nazwa Katalog
do
if [ $Nazwa = $PomN ]
then
    Wynik=$Wynik$Katalog   
else                                               
    echo "$Wynik"
    PomN=$Nazwa
    Wynik="$Nazwa : "$Katalog
fi
done
} 