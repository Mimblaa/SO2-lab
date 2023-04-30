#!/bin/bash

set -eu

#sprawdzic czy podano sciezke
if [[ $# -eq 0 ]]; then
    echo "Nie podano ścieżki katalogu jako parametru."
    exit 1
fi

#sprawdzic czy podano katalog
if [[ ! -d "$1" ]]; then
    echo "Podana ścieżka nie jest katalogiem lub nie istnieje."
    exit 1
fi

#plikowi regularnemu z rozszerzeniem .bak odebrac uprawnienia do edytowania dla wlasciciela i innych
find "$1" -type f -name "*.bak" -exec chmod uo-w "$PWD/{}" \;

#KATALOGOWI z rozszerzeniem .bak pozwolic wchodzic do srodka tylko innym
find "$1" -type d -name "*.bak" -exec chmod a-x o+x "$PWD/{}" \;

#KATALOGOWI Z ROZSZERZENIEM .tmp pozwoli tworzyc i usuwac jego pliki
find "$1" -type d -name "*.tmp" -exec chmod a+rwx "$PWD/{}" \;

#pliki z rozszerzeniem .txt beda czytac tylko wlasciciele, edytowac grupa wlascicieli, wykonywac inni
find "$1" -type f -name "*.txt" -exec chmod 760 "$PWD/{}" \;
