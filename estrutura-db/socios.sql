-- Criar a tabela socio
CREATE TABLE socios (
    cnpj_basico VARCHAR(8) NOT NULL,
    identificador_socio VARCHAR(1) NOT NULL,
    nome_socio VARCHAR(150),
    cnpj_cpf_socio VARCHAR(14),
    cod_qualificacao_socio VARCHAR(2) NOT NULL,
    perc_capital_social VARCHAR(5),
    data_entrada_sociedade VARCHAR(8) NOT NULL,
    cod_pais_exterior VARCHAR(3),
    nome_pais_exterior VARCHAR(70),
    cpf_representante_legal VARCHAR(11),
    nome_representante_legal VARCHAR(150),
    cod_qualificacao_representante_legal VARCHAR(2)
);