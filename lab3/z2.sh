#!/bin/bash -eu

#Z pliku yolo.csv wypisz imię każdego, kto jest wart dokładnie $2.99 lub $5.99 lub $9.99. Nie wazne czy milionów, czy miliardów (tylko nazwisko i wartość). Wyniki zapisz na standardowe wyjście błędów
cut -d ',' -f 3,7 yolo.csv | grep -E '\$2\.99|\$5\.99|\$9\.99' 2> /dev/stderr


#Z pliku yolo.csv wypisz każdy numer IP, który w pierwszym i drugim oktecie ma po jednej cyfrze. Wyniki zapisz na standardowe wyjście błędów"
cut -d',' -f6 yolo.csv | grep -E '^[0-9]\.[0-9]\.' 2> /dev/stderr
