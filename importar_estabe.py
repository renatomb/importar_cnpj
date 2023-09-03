# RMB Informatica - www.rmbinformatica.com
# Importador de dados do CNPJ para o banco de dados MySQL
#
# Exemplo de importador de dados de Estabelecimentos do CNPJ
# Repositorio do projeto: https://github.com/renatomb/importar_cnpj/
# Autor: Renato Monteiro Batista (https://renato.ovh)
# Data: 2023-09-02 


# Importar os módulos necessários
import csv
import mysql.connector
import configparser
from pathlib import Path
import sys

def limpar_espacos_repetidos(texto):
    # Limpar espaços repetidos
    texto = texto.strip()
    while "  " in texto:
        texto = texto.replace("  ", " ")
    # Tratar valores vazios como null
    if texto == "":
        texto = None
    return texto

def remover_espacos(texto):
    # Remover todos os espaços
    texto = texto.strip()
    while " " in texto:
        texto = texto.replace(" ", "")
    # Tratar valores vazios como null
    if texto == "":
        texto = None
    return texto

def tx_data_sql(texto):
    # Transformar a data no formato aaaammdd para aaaa-mm-dd
    texto = texto.strip()
    if len(texto) == 8:
        texto = texto[0:4] + "-" + texto[4:6] + "-" + texto[6:8]
    return texto

path = Path('config-db.ini')
if path.is_file():
    # Conectar ao banco de dados MySQL
    config = configparser.ConfigParser()
    config.read(path)
    HOST = config["db"]['host']
    USER = config["db"]['usuario']
    PASS = config["db"]['senha']
    DBAS = config["db"]['banco']

    conexao = mysql.connector.connect(
        host=HOST,
        user=USER,
        password=PASS,
        database=DBAS
    )
    # Criar um objeto cursor
    cursor = conexao.cursor()

    # Receber o nome do arquivo csv como parâmetro na linha de comando
    arquivo = sys.argv[1]

    # Abrir o arquivo csv no modo leitura
    with open(arquivo, "r", encoding="utf-8") as f:
        # Criar um objeto leitor csv
        leitor = csv.reader(f, delimiter=";", quotechar='"')
        # Ignorar a primeira linha do arquivo (cabeçalho)
        next(leitor)
        # Percorrer o arquivo linha a linha
        for linha in leitor:
            # Extrair os campos da linha
            cnpj_basico = limpar_espacos_repetidos(linha[0])
            cnpj_ordem = limpar_espacos_repetidos(linha[1])
            cnpj_dv = limpar_espacos_repetidos(linha[2])
            matriz_filial = limpar_espacos_repetidos(linha[3])
            nome_fantasia = limpar_espacos_repetidos(linha[4])
            situacao_cadastral = limpar_espacos_repetidos(linha[5])
            data_situacao_cadastral = limpar_espacos_repetidos(linha[6])
            motivo_situacao_cadastral = limpar_espacos_repetidos(linha[7])
            cidade_exterior = limpar_espacos_repetidos(linha[8])
            cod_pais = limpar_espacos_repetidos(linha[9])
            data_inicio_ativ = limpar_espacos_repetidos(linha[10])
            cnae_fiscal = limpar_espacos_repetidos(linha[11])
            cnae_secundario = limpar_espacos_repetidos(linha[12])
            tipo_logradouro = limpar_espacos_repetidos(linha[13])
            logradouro = limpar_espacos_repetidos(linha[14])
            numero = limpar_espacos_repetidos(linha[15])
            complemento = limpar_espacos_repetidos(linha[16])
            bairro = limpar_espacos_repetidos(linha[17])
            cep = limpar_espacos_repetidos(linha[18])
            uf = limpar_espacos_repetidos(linha[19])
            cod_municipio = limpar_espacos_repetidos(linha[20])
            ddd_1 = limpar_espacos_repetidos(linha[21])
            telefone_1 = limpar_espacos_repetidos(linha[22])
            ddd_2 = limpar_espacos_repetidos(linha[23])
            telefone_2 = limpar_espacos_repetidos(linha[24])
            ddd_fax = limpar_espacos_repetidos(linha[25])
            num_fax = limpar_espacos_repetidos(linha[26])
            email = limpar_espacos_repetidos(linha[27])

            # Criar um comando SQL para inserir os campos na tabela estabe
            sql = "INSERT INTO estabe (cnpj_basico, cnpj_ordem, cnpj_dv, matriz_filial, nome_fantasia, situacao_cadastral, data_situacao_cadastral, motivo_situacao_cadastral, cidade_exterior, cod_pais, data_inicio_ativ, cnae_fiscal, cnae_secundario, tipo_logradouro, logradouro, numero, complemento, bairro, cep, uf, cod_municipio, ddd_1, telefone_1, ddd_2, telefone_2, ddd_fax, num_fax, email) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"

            # Criar uma tupla com os valores dos campos
            valores = (cnpj_basico, cnpj_ordem, cnpj_dv, matriz_filial, nome_fantasia, situacao_cadastral, data_situacao_cadastral, motivo_situacao_cadastral, cidade_exterior, cod_pais, data_inicio_ativ, cnae_fiscal, cnae_secundario, tipo_logradouro, logradouro, numero, complemento, bairro, cep, uf, cod_municipio, ddd_1, telefone_1, ddd_2, telefone_2, ddd_fax, num_fax, email)

            # Executar o comando SQL com os valores dos campos
            cursor.execute(sql,valores)

            # Imprime . na tela indicativo de execução
            print(".", end="")
            conexao.commit()

    # Fechar o cursor e a conexão
    cursor.close()
    conexao.close()