#!/bin/bash -eu


#Uruchom skrypt fakaping.sh, wszystkie linijki mające zakończenie .conf zachowaj. Wypisz na ekran i do pliku find_results.log. Odfiltruj błędy do pliku: errors.log.
./fakaping.sh | grep -e '\.conf$' | tee find_results.log | grep -e 'PERMISSION DENIED' > errors.log

#Uruchom skrypt fakaping.sh, wszystkie errory zawierające ""permission denied"" (bez względu na wielkośc liter) wypisz na konsolę i do pliku denied.log. Wyniki powinny być unikalne.
./fakaping.sh 2>&1 | grep -i "permission denied" | sort -u | tee denied.log

#Uruchom skrypt fakaping.sh i wszystkie unikalne linijki zapisz do pliku all.log i na konsolę
./fakaping.sh 2>&1 | sort -u | tee all.log
