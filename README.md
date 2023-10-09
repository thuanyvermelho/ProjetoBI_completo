# Implementando um Data Warehouse com Python
Este repositório contém o código e a documentação para a construção de um Data Warehouse (DW) para análises de ocorrências policiais. O ETL (Extração, Transformação e Carga) é realizado usando SQL e Python.

## Objetivo
O objetivo deste projeto é criar a arquitetura de um Data Warehouse que abrange a estrutura, o design e a organização dos componentes, incluindo as tabelas de dimensão, a tabela fato, as transformações de dados, a modelagem de dados, entre outros aspectos. O Data Warehouse é construído seguindo o modelo estrela, tabelas de dimensão e tabela fato.

## Estratégia de Implementação
Nossa estratégia de implementação se divide em duas etapas principais:

**Stage:** Inicialmente, iremos criar a infraestrutura necessária para a etapa de stage. Nesta fase, iremos extrair os dados brutos de arquivos csv e fazer um webscraping do site IBGE, realizar as transformações iniciais e preparar os dados para serem inseridos no Data Warehouse.

**Data Warehouse:** Após a conclusão da etapa de stage, avançaremos para a criação do Data Warehouse propriamente dito. Construiremos as tabelas de dimensão e a tabela fato.

## Modelo Estrela (Star Schema)
O "Modelo Estrela" em Data Warehouses liga tabelas de dimensão à tabela fato central, simplificando a análise de dados devido à sua estrutura intuitiva. Abaixo está uma representação do modelo estrela utilizado neste projeto:

![image](https://github.com/thuanyvermelho/ProjetoBI_completo/assets/104110519/edd5f1c9-5931-4391-9970-e07f0fb85ae0)


## Tecnologias Utilizadas
**PostgreSQL versão 15 :** Banco de dados utilizado para armazenar os dados do Data Warehouse.<br>
**Python 3.1.1 :** Linguagem de programação usada para a automação do ETL.<br>
**Jupyter Notebook:** Ambiente de desenvolvimento para a criação e execução de scripts Python.<br>
**SQL:** Linguagem de consulta usada para transformar e carregar os dados no DW.<br>
**Bibliotecas Python:** Pandas, psycopg2, datetime , create_engine, inspect<br>

## Estrutura do Projeto
O projeto está estruturado da seguinte forma:

- `/DataWarehouse_Python.py`: Este arquivo contém um notebook Jupyter com o código SQL e Python para o processo de ETL (Extração, Transformação e Carga).
- `/dados`: A documentação do projeto, incluindo os arquivos CSV utilizados na extração dos dados.


## Passos para Executar o ETL

Aqui estão os passos necessários para executar o processo ETL (Extração, Transformação e Carga):

1. Configure um banco de dados PostgreSQL e crie um esquema específico para a carga de Satge e um para a carga do Data Warehouse.
   - Utilize a pasta `dados` para armazenar os arquivos CSV utilizados na extração dos dados.

2. Após baixar os arquivos CSV, execute o notebook Jupyter para realizar o ETL completo.
   - Utilize `/DataWarehouse_Python.py` para executar todo o processo, incluindo extração, transformação e carga (certifique-se de configurar a conexão com o banco de dados).

## Contribuições
Contribuições são bem-vindas! Se você encontrar melhorias ou tiver sugestões para este projeto, sinta-se à vontade para abrir uma issue ou enviar um pull request.
