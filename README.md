# importar_cnpj

Esse projeto visa fazer o download da base da dados de CNPJ da receita federal diretamente através do portal dados abertos, utilizando o wget na função mirror.
Após o download será feita a descompactação dos arquivos zip, seguidos alteração da codificação de caracteres para UTF8.
Serão criadas as respectivas tabelas no banco de dados mysql, conforme o número de colunas de cada arquivo CSV.
Por fim, serão importados os registros dos arquivos CSV no banco de dados mysql usando o cliente mysql para linux com o comando LOAD DATA.

# Como usar

Simplesmente execute o script importar_cnpj.sh

```bash
./importar_cnpj.sh
```

# Requisitos

- wget
- unzip
- mysql-client
- python3

## Módulos do python

Instalação dos requisitos do script python:

```bash
python3 -m pip install -r requirements.txt
```

## Licença GNU GPL v3

Você pode fazer quase qualquer coisa que você queira com esse projeto, exceto distribuir o código fonte em projetos de código fechado.

## Dúuvidas sobre o projeto

O projeto foi desenvolvido para fins de estudo e prova de conceito. O projeto está disponibilizado como está, sem garantias de funcionamento. Devido ao meu tempo limitado e compromisso com outros projetos somente poderei prestar qualquer tipo de auxilio mediante compensação financeira, caso seja de seu interesse entrar em contato [via telegram](https://t.me/r3n4t0), somente tenho condições de responder texto e não sou capaz ouvir mensagens de áudio.

## Contribuições

### Com o código

Se você quiser contribuir com o código, você pode fazer um fork do projeto e enviar um pull request.

### Financeiras

Se esse projeto te auxiliou de alguma forma, você pode contribuir financeiramente para que eu possa continuar a desenvolver projetos open source. As contribuições podem ser:

- PIX: **7d01a281-27e5-4396-8b55-f19d3d90f348**
- Bitcoin: **bc1qqj3w8a7vp59zxyw75hl9tm6ezn9jfrtrnqxyhr**
- Monero: **457h16yahCt8VWCTXySGRn9WDhhQ3aL8k5AY9RGF12Bu2Qh39xyurVmgLmQVeX6cADVinsN6KizP6BniuWAf6fQCKQW4Z6z**
- Stellar: **GBPCBMXN2WGFKL2P4CQFFJPLXVSNV43NL2MXEQCKUK2WBEWQ6MRENATO**
- Gift cards Uber, iFood, Amazon, Google Play, Steam, Apple Store, Outback, etc: Enviar mensagem [via telegram](https://t.me/r3n4t0) ou [via DM no twitter](https://twitter.com/renatomb)