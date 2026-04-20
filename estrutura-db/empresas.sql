-- Criar a tabela empre
CREATE TABLE empresas (
    cnpj_basico VARCHAR(8) NOT NULL,
    razao_social VARCHAR(150) NOT NULL,
    natureza_juridica VARCHAR(4) NOT NULL,
    qualif_juridica VARCHAR(2) NOT NULL,
    capital_social VARCHAR(20) NULL DEFAULT NULL,
    porte VARCHAR(2) NOT NULL,
    ente_federativo_responsavel TEXT NULL DEFAULT NULL
);
