#!/bin/bash -eu


#We wszystkich plikach w katalogu ‘groovies’ zamień $HEADER$ na /temat/
sed -i 's/\$HEADERS\$\/temat\//g' groovies/*

#We wszystkich plikach w katalogu ‘groovies’ usuń linijki zawierające frazę 'Help docs:'"
sed -i 's/Help docs:/d' groovies/*