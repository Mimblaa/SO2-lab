#!/bin/bash -eu

#Znajdź w pliku access_log zapytania, które mają frazę ""denied"" w linku
grep "/denied" access_log

#Znajdź w pliku access_log zapytania wysłane z IP: 64.242.88.10
grep -w "64.242.88.10" access_log

#Znajdź w pliku access_log wszystkie zapytania NIEWYSŁANE z adresu IP tylko z FQDN
grep -vE "^([0-9]{1,3}\.){3}[0-9]{1,3}" access_log

#Znajdź w pliku access_log unikalne zapytania typu DELETE
grep "DELETE" access_log | sort -u -k7,7

