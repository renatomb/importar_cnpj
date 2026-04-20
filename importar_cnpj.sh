#!/bin/bash
# Script para download e importação da base de dados CNPJ disponibilizada
# no portal Dados Abertos da Receita Federal do Brasil
#
# Autor: Renato Monteiro Batista
# Data: 12/02/2023
#
# Versão 1.0

ICNPJ=$(pwd)
source credenciais.txt 
./download_cnpj.sh

# uma vez feito o download do arquivo só me interessa os arquivos .zip
mkdir $ICNPJ/200.152.38.155/zip
mv $ICNPJ/200.152.38.155/CNPJ/*.zip $ICNPJ/200.152.38.155/zip/
mv $ICNPJ/200.152.38.155/CNPJ/regime_tributario/*.zip $ICNPJ/200.152.38.155/zip/

# Descompactar todos os arquivos zip existentes no diretório atual
for file in $ICNPJ/200.152.38.155/zip/Empresas*.zip; do
  unzip "$file"
  for arquivo in *CSV; do
    $ICNPJ/carregar_csv.sh $arquivo empresas
  done
  rm -f "$file"
done

for file in $ICNPJ/200.152.38.155/zip/Estabelecimentos*.zip; do
  unzip "$file"
  for arquivo in *ESTABELE; do
    iconv -f iso-8859-1 -t utf-8 "$arquivo" > "estabele.csv"
    python3 $ICNPJ/importar_estabe.py estabele.csv
    rm -f estabele.csv
    rm -f $arquivo
  done
  rm -f "$file"
done

for file in $ICNPJ/200.152.38.155/zip/Socios*.zip; do
  unzip "$file"
  for arquivo in *CSV; do
    $ICNPJ/carregar_csv.sh $arquivo socios
  done
  rm -f "$file"
done

for file in $ICNPJ/200.152.38.155/zip/*.zip; do
  unzip "$file"
  for arquivo in *CSV; do
    $ICNPJ/carregar_csv.sh $arquivo
  done
  rm -f "$file"
done