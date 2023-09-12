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
cd 200.152.38.155/
mkdir zip
mv CNPJ/*.zip zip/
mv CNPJ/regime_tributario/*.zip zip/
cd zip

# Descompactar todos os arquivos zip existentes no diretório atual
for file in Empresas*.zip; do
  unzip "$file"
  for arquivo in *CSV; do
    $ICNPJ/carregar_csv.sh $arquivo empresas
  done
  rm -f "$file"
done

for file in Estabelecimentos*.zip; do
  unzip "$file"
  for arquivo in *ESTABELE; do
    python3 $ICNPJ/importar_estabe.py $arquivo
    rm -f $arquivo
  done
  rm -f "$file"
done

for file in Socios*.zip; do
  unzip "$file"
  for arquivo in *CSV; do
    $ICNPJ/carregar_csv.sh $arquivo socios
  done
  rm -f "$file"
done

for file in *.zip; do
  unzip "$file"
  for arquivo in *CSV; do
    $ICNPJ/carregar_csv.sh $arquivo
  done
  rm -f "$file"
done