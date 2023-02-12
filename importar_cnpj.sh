#!/bin/bash
# Script para download e importação da base de dados CNPJ disponibilizada
# no portal Dados Abertos da Receita Federal do Brasil
#
# Autor: Renato Monteiro Batista
# Data: 12/02/2023
#
# Versão 1.0

./download_cnpj.sh

# uma vez feito o download do arquivo só me interessa os arquivos .zip
cd 200.152.38.155/
mkdir zip
mv CNPJ/*.zip zip/
mv CNPJ/regime_tributario/*.zip zip/
cd zip

# Descompactar todos os arquivos zip existentes no diretório atual
for file in *.zip; do
  unzip "$file"
done

for file in *CSV; do
   ./carregar_csv.sh $file
done