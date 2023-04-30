#!/bin/bash

#2 paraletry-2 sciezki do katalogow
KAT_1=${1}
KAT_2=${2}

#poinformowac ze nie podano parametrow
if [[ $# -ne 2 ]]; then
    echo "nie podano nazw katalogow"
    exit 1
fi

#upewnic sie czy dane katalogi istnieja
if [[ ! -d "${KAT_1}" ]]; then
    echo "Katalog ${KAT_1} nie istnieje"
    exit 1
fi

if [[ ! -d "${KAT_2}" ]]; then
    echo "Katalog ${KAT_2} nie istnieje"
    exit 1
fi



DIR_1=$(cd "${KAT_1}" && pwd)
DIR_2=$(cd "${KAT_2}" && pwd)

echo "Pliki w katalogu ${KAT_1}:"
for FILE in ${KAT_1}/*; do
F2=${FILE##*/}
    if [[ -d ${FILE} ]]; then
        echo "${FILE} to katalog"
        ln -s ${DIR_1}/${F2} ${DIR_2}/${F2^^}
    elif [[ -L ${FILE} ]]; then
        echo "${FILE} to dowiazanie symboliczne"
    elif [[ -f ${FILE} ]]; then
        echo "${FILE} to plik regularny"
        ln -s ${DIR_1}/${F2} ${DIR_2}/${F2^^}
    else
        echo "${FILE} to nie jest ani katalog, ani plik regularny, ani dowiazanie symboliczne"
    fi
done