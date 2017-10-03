#!/bin/bash

#In specified text file find references to equation numbers ("(number)") and list in format:
#"(equation number): row1, row2, row3, ..."

if [ $# != 1 ]
then
  echo "ilosc argumentow inna niz jeden"
  exit 1
fi

if [ ! -f $1 ]
then
  echo "1 argument nie jest plikiem"
  exit 2
fi

awk 'BEGIN {RS = "\n"; tablica[1]="";}
{
for (i=1; i<=NF; i++)
{
    if($i ~ /\([[:digit:]]\)/)
    {
    split($i, a, /[,.;:?!]/);
    tablica[a[1]]=sprintf("%s %s", tablica[a[1]], FNR);
    }
}
}
END {for (x in tablica)
{
printf ("%s: %s\n", x, tablica[x])
}
}' $1 