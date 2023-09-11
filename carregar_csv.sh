#!/bin/bash
# Script para importação da base de dados CNPJ a partir do
# arquivo de dados CSV.
#
# Autor: Renato Monteiro Batista
# Data: 12/02/2023
#
# Versão 1.0

file=$1

# Se for especificado o segundo parâmetro será usado como nome da tabela
if [ $# -eq 2 ]; then
  table_name=$2
else
  table_name=${file##*.}
  # Contar o número de colunas no arquivo CSV
  cols=$(head -n 2 "$file" | tail -n 1 | awk -F\; '{print NF}')

  echo "Criando tabela $table_name com $cols colunas"
  # Criar tabela dinamicamente
  create_table="CREATE TABLE IF NOT EXISTS $table_name ("
  for i in $(seq 1 $cols); do
    create_table="$create_table col$i TEXT"
    if [ $i -lt $cols ]; then
      create_table="$create_table, "
    fi
  done
  create_table="${create_table%, });"
  mysql -h $host -u $user -p$password $database -e "$create_table"
fi

echo "Carregando arquivo $file"

# Altera a codificação de caracteres do arquivo para UTF-8
echo "Alterando codificacao de caracteres de $file > $table_name.csv..."
iconv -f iso-8859-1 -t utf-8 "$file" > "$table_name.csv"

echo "Excluindo $file..."
rm -f "$file"
file="$table_name.csv"

# Carrega as credenciais salvas no arquivo credenciais.txt
source credenciais.txt 

# Importar os dados a partir do arquivo CSV
load_data="LOAD DATA LOCAL INFILE '$file' REPLACE INTO TABLE $table_name FIELDS TERMINATED BY ';' ENCLOSED BY '\"' LINES TERMINATED BY '\n';"

echo "Carregando dados do arquivo $file"
mysql -h $host -u $user -p$password $database -e "$load_data"

# Exibir o número de linhas da tabela
mysql -h $host -u $user -p$password $database -e "SELECT COUNT(*) FROM $table_name;"

echo "Arquivo $file carregado com sucesso na tabela $table_name"
rm -f $table_name.csv
