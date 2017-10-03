#!/bin/bash

#In specified directory tree find symbolic links pointing to files with the same name (extension type can be different)

if [ $# != 1 ]
then
  echo "Ilosc argumentow inna niz jeden."
  exit 1
fi

if [ ! -d $1 ]
then
  echo "1 argument nie jest katalogiem."
  exit 2
fi

find $1 -type l -printf "%l\t%p\n" | {
awk '
BEGIN    {FS = "\t"; idxP = 0; idxS = 0;}
    {
    idxP = split($1, Plik, "\/");
    split(Plik[idxP], NazwaPliku, "\.");

    idxS = split($2, Dow, "\/");
    split(Dow[idxS], NazwaDow, "\.");
   
    #printf("%s || %s\n", $1, $2);
    #printf("%s || %s\n", Plik[idxP], Dow[idxS]);
    #printf("%s || %s\n", NazwaPliku[1], NazwaDow[1]);
    if (NazwaPliku[1] == NazwaDow[1])
    {printf("Plik: %s\nDowiazanie: %s\n", $1, $2);}
    }
'
} 