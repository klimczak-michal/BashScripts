#!/bin/bash

#File listing of specific directory with its subdirectories
#Subdirectories listed as:
#<path in regards to original directory>/<filename>
#Limit the depth of subdirectory listing (i.e. 2).

Liczba = 2
if[ $# -ne 1 ]
then
    echo "Zla ilosc argumentow"
    echo "Poprawnie: $0 katalog"
    exit
fi

if [ ! -d $1 ]
then
    echo "$1 nie jest katalogiem"
    exit 1
fi

function pokaz_zawartosc_kat
{
        ZAWARTOSC=`ls $1`
        for plik in $ZAWARTOSC
        do
                if [ -d $1/$plik ]
                then
                        if [[ $Liczba -gt 0 ]]
                        then
                                let Liczba=Liczba-1
                                echo "$1/$plik"
                                pokaz_zawartosc_kat $1/$plik
                                let Liczba=Liczba+1
                        fi
                else
                        echo "$1/$plik"
                fi
        done
}

pokaz_zawartosc_kat $1 