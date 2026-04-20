/*
RMB Informatica - www.rmbinformatica.com
Importador de dados do CNPJ para o banco de dados MySQL

Estrutura de banco de dados da tabela de estabelecimentos
Para importação dos dados com higienização vide importador importar_estabe.py

Repositorio do projeto: https://github.com/renatomb/importar_cnpj/
Autor: Renato Monteiro Batista (https://renato.ovh)
*/

CREATE TABLE estabelecimentos (
    cnpj_basico VARCHAR(8) NOT NULL,
    cnpj_ordem VARCHAR(4) NOT NULL,
    cnpj_dv VARCHAR(2) NOT NULL,
    matriz_filial VARCHAR(1) NOT NULL,
    nome_fantasia VARCHAR(150),
    situacao_cadastral VARCHAR(2) NOT NULL,
    data_situacao_cadastral VARCHAR(8) NOT NULL,
    motivo_situacao_cadastral VARCHAR(2),
    cidade_exterior TEXT NULL DEFAULT NULL,
    cod_pais VARCHAR(3) NULL DEFAULT NULL,
    data_inicio_ativ VARCHAR(8) NOT NULL,
    cnae_fiscal VARCHAR(7) NOT NULL,
    cnae_secundario TEXT NULL,
    tipo_logradouro VARCHAR(20),
    logradouro VARCHAR(60),
    numero VARCHAR(6),
    complemento VARCHAR(156),
    bairro VARCHAR(50),
    cep VARCHAR(8),
    uf VARCHAR(2),
    cod_municipio VARCHAR(7) NOT NULL,
    ddd_1 VARCHAR(4),
    telefone_1 VARCHAR(8),
    ddd_2 VARCHAR(4),
    telefone_2 VARCHAR(8),
    ddd_fax VARCHAR(4),
    num_fax VARCHAR(8),
    email VARCHAR(115)
);
