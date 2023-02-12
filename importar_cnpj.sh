#!/bin/bash
# Script para importação da base de dados CNPJ disponibilizada
# no portal Dados Abertos da Receita Federal do Brasil
#
# Autor: Renato Monteiro Batista
# Data: 12/02/2023
#
# Versão 0.1 beta

# Download (mirror) dos arquivos no portal de dados abertos da Receita Federal
wget --mirror --convert-links --adjust-extension --page-requisites --no-parent http://200.152.38.155/CNPJ/

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
   table_name=${file##*.}
   echo $table_name
done