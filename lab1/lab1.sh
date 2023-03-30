#!/bin/bash


SOURCE_DIR=${1:-lab_uno}
RM_LIST=${2:-2remove}
TARGET_DIR=${3:-bakap}


echo "Wartość SOURCE_DIR: ${SOURCE_DIR}"
echo "Wartość RM_LIST: ${RM_LIST}"
echo "Wartość TARGET_DIR: ${TARGET_DIR}"


if [[ ! -d ${TARGET_DIR} ]]; then
    mkdir ${TARGET_DIR}    
fi

NAMES=$(cat ${RM_LIST})
for NAME in ${NAMES}; do
    if [[ -e ${SOURCE_DIR}/${NAME} ]]; then
        rm -rf -r ${SOURCE_DIR}/${NAME}  
        echo "usunieto plik ${NAME}"
    fi
done < ${RM_LIST}

for FILE in ${SOURCE_DIR}/*; do
    if [[ -f ${FILE} ]]; then
        mv ${FILE} ${TARGET_DIR}
        echo "Przeniesiono plik ${FILE}"
    elif [[ -d ${FILE} ]]; then
        cp -r ${FILE} ${TARGET_DIR}
        echo "Skopiowano katalog ${FILE}"
    fi
done

COUNT=$(ls ${SOURCE_DIR} | wc -l)
if [[ ${COUNT} -gt 0 ]]; then
  echo "Jeszcze coś zostało"
  if [[ ${COUNT}  -ge 2 ]]; then
    echo "Zostały co najmniej 2 pliki"
    if [[ ${COUNT}  -gt 4 ]]; then
        echo "Zostało więcej niż 4 pliki"
    else
        echo "Zostało między 2 a 4 pliki"
    fi
  else
    echo "Pozostał tylko 1 plik"
  fi
else
  echo "Tu był Kononowicz"
fi

zip -r "bakap_$(date +'%Y-%m-%d').zip" ${TARGET_DIR}


