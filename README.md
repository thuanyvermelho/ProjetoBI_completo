# Etapa 1: Criação do Banco de Dados e Consultas SQL

Nesta primeira etapa do projeto, concentramos nossos esforços na criação do banco de dados destinado a registrar ocorrências policiais durante o período de 2018 a 2021. Esta fase envolve desde o levantamento dos dados iniciais até a construção da arquitetura do banco e a elaboração de consultas SQL para análises detalhadas.

## Levantamento dos Dados

O processo de criação de um banco de dados eficaz começa com o levantamento de dados relevantes. Para esta etapa do projeto, os dados foram extraídos do site [ISP Dados RJ](http://www.ispdados.rj.gov.br/estatistica.html).

- Identificamos as fontes de dados, que incluem arquivos CSV disponibilizados pelo Instituto de Segurança Pública do Rio de Janeiro.

- Todos os arquivos CSV extraídos estão disponíveis na pasta [dados](link-para-a-pasta-dados-fonte) deste repositório.

## Criação da Estrutura do Banco de Dados

Com os dados levantados, prosseguimos com a criação da estrutura do banco de dados. Isso envolve:

- Criar o modelo de entidade e relação e modelo lógico  

- Definir tabelas para armazenar diferentes tipos de informações, como informações sobre tipo de ocorrências, DP´s, BPM´s, municipio, Delegados, etc.

- Estabelecer relacionamentos entre tabelas para garantir que os dados sejam armazenados de maneira organizada e consistente.

- Implementar chaves primárias e estrangeiras para manter a integridade referencial dos dados.

- Inclusão de índices para melhorar o desempenho das consultas.

##  Contribuições Adicionais

Ao longo da maior parte deste curso, trabalhei em colaboração com o conteúdo e diretrizes fornecidos, absorvendo conhecimentos essenciais na criação do banco de dados e sua arquitetura. No entanto, também encontrei oportunidades para aprimorar meu aprendizado em áreas específicas:

### Modelo Lógico
Elaborei o modelo lógico do banco de dados MySQL Workbench, que envolveu a definição das tabelas, seus relacionamentos e a estrutura geral do banco. Esta etapa foi essencial para garantir a organização e a consistência dos dados.

### Inserção de Tabela de Municípios
Inseri a tabela de municípios no banco de dados, enriquecendo-o com informações geográficas importantes. Isso nos permite analisar as ocorrências policiais de forma mais contextualizada por município.

### Consultas SQL de Nível Intermediário a Avançado
Criei consultas SQL de nível intermediário a avançado para aprofundar meus conhecimentos em SQL e explorar análises mais detalhadas. Estas consultas abrangem tópicos como junções complexas, subconsultas avançadas, funções de janela e operações de conjunto.

Minha jornada de aprendizado durante o curso foi enriquecida não apenas pela absorção de conhecimento fornecido, mas também pela minha participação ativa em áreas específicas, nas quais busquei aprimorar minhas habilidades e aprofundar minha compreensão. 

## Diretórios Principais
Neste projeto, você encontrará os seguintes diretórios principais:

1 - **dados/:** Contém arquivos CSV que serviram como fonte de dados para a criação do banco.

2 - **Ocorrencia1/:** Backup de Banco de Dados SQL.

3 - **queries/:** Aqui estão todas as consultas SQL desenvolvidas, cobrindo diferentes níveis de complexidade.

4 - **modelo-fisico.png:** Uma imagem que representa visualmente a estrutura física do banco de dados.
