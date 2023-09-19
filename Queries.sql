-- Número total de ocorrências policiais por ano
SELECT      
       Ano,
       count(qtde) as total_ocorrencias
FROM tbRegOcorrencias
GROUP BY ano 
ORDER BY ano 
 
-- Média das quantidades de ocorrência por DP, BPM, ano 

SELECT 
    b.nmDP as DP,
    c.nmBPM as BPM,
    a.ano as Ano,
    ROUND(AVG(a.qtde),2) as 'Média de Ocorrências'    
FROM tbRegOcorrencias a 
INNER JOIN tbDP b 
    ON b.codDP = a.codDP
INNER JOIN tbBPM c 
    ON c.codBPM = a.codBPM
GROUP BY
      b.nmDP,
      c.nmBPM,
      a.ano

-- Ano que mais teve ocorrencia
WITH TotalOcorrenciasPorAno AS (
    SELECT
        ano,
        COUNT(*) AS TotalOcorrenciasPorAno
    FROM
        tbRegOcorrencias
    GROUP BY
        ano
)
SELECT
    ano,
    max(TotalOcorrenciasPorAno) AS total_ocorrencias
FROM
    TotalOcorrenciasPorAno;

    
-- Ranqueamento das DPS e BPMs, de acordo com o Total de ocorrências registradas
SELECT
    b.nmDP as DP,
    c.nmBPM as BPM,
    SUM(a.qtde) as 'Total Ocorrências',
    RANK() OVER (ORDER BY SUM(a.qtde) DESC) AS Rank
FROM tbRegOcorrencias a
INNER JOIN tbDP b ON a.codDP = b.codDP
INNER JOIN tbBPM c ON a.codBPM = c.codBPM
GROUP BY b.nmDP, c.nmBPM


-- Após o resultado da consulta da DP/BPM com maior numero de ocorrencia, liste e ordene do maior 
-- para o menor quais foram as ocorrencias e a qtde de ocorrencia  

WITH TotalOcorrenciasNaDP AS (
    SELECT
        a.ocorrencia AS Tipo_Ocorrencia,
        SUM(a.qtde) AS Total_Ocorrencias
    FROM
        tbRegOcorrencias a
    INNER JOIN
        tbDP b ON a.codDP = b.codDP
    WHERE
        b.nmDP LIKE '%059%' -- Filtra apenas a DP 059
    GROUP BY
        a.ocorrencia
)
SELECT
    Tipo_Ocorrencia,
    Total_Ocorrencias
FROM
    TotalOcorrenciasNaDP
ORDER BY
    Total_Ocorrencias DESC;


-- As 10 maiores quantidade de ocorrencia por municipio

SELECT
    b.nomeMunicipio,
    COUNT(*) AS TotalOcorrencias
FROM
    tbRegOcorrencias as a
INNER JOIN tbMunicipios as b on a.codMunicIBGE = b.codMunicIBGE
GROUP BY 
    b.nomeMunicipio
ORDER BY 
 TotalOcorrencias desc
limit 10


-- Qtde Total de Ocorrências por Tipo de Crime e Porcentagem Anual por Tipo de Crime - agrupando por tipo de ocorrencia e por ano.

WITH TotalOcorrenciasPorAno AS (
    SELECT ano,
           COUNT( * ) AS TotalPorAno
      FROM tbRegOcorrencias
     GROUP BY Ano
)
SELECT a.ocorrencia AS Ocorrencias,
       COUNT( * ) AS Total_Ocorrencias,
       ROUND( (COUNT( * ) * 100.0 / TotalOcorrenciasPorAno.TotalPorAno), 2) AS Porcentagem_Ocorrencia,
       a.ano
FROM tbRegOcorrencias a
INNER JOIN 
       TotalOcorrenciasPorAno ON a.Ano = TotalOcorrenciasPorAno.Ano
GROUP BY a.ocorrencia,
          a.Ano

-- Comparação de ocorrencias no primeiro e no segundo ano de pandemia

WITH TotalOcorrenciasPorAno AS (
    SELECT
        ano,
        COUNT(*) AS TotalOcorrencias
    FROM
        tbRegOcorrencias
    WHERE
        ano IN (2020, 2021) -- Filtra os anos desejados
    GROUP BY
        ano
)
SELECT
    ano,
    TotalOcorrencias
FROM
    TotalOcorrenciasPorAno;

-- Comparação de ocorrencias entre os anos de 2020 á 2021 e mensure a diferença da quantidade entre eles.

WITH TotalOcorrenciasPorTipoEAno AS (
    SELECT
        ano,
        ocorrencia AS TipoOcorrencia,
        COUNT(*) AS TotalOcorrencias
    FROM
        tbRegOcorrencias
    WHERE
        ano IN (2020, 2021) -- Filtra os anos desejados
    GROUP BY
        ano, TipoOcorrencia
)
SELECT
    TipoOcorrencia,
    SUM(CASE WHEN ano = 2020 THEN TotalOcorrencias ELSE 0 END) AS Total2020,
    SUM(CASE WHEN ano = 2021 THEN TotalOcorrencias ELSE 0 END) AS Total2021,
    SUM(CASE WHEN ano = 2020 THEN TotalOcorrencias ELSE 0 END) - SUM(CASE WHEN ano = 2021 THEN TotalOcorrencias ELSE 0 END) AS Diferenca,
    CASE
        WHEN SUM(CASE WHEN ano = 2020 THEN TotalOcorrencias ELSE 0 END) = 0 THEN NULL
        ELSE ROUND(((SUM(CASE WHEN ano = 2021 THEN TotalOcorrencias ELSE 0 END) - SUM(CASE WHEN ano = 2020 THEN TotalOcorrencias ELSE 0 END)) * 100.0) / SUM(CASE WHEN ano = 2020 THEN TotalOcorrencias ELSE 0 END))
    END AS Porcentagem
FROM
    TotalOcorrenciasPorTipoEAno
GROUP BY
    TipoOcorrencia
ORDER BY
    TipoOcorrencia;


-- Média de Ocorrências de Roubo por Distrito Policial

SELECT d.nmDP AS NomeDistritoPolicial, 
    AVG(o.qtde) AS MediaOcorrenciasRoubo
FROM tbRegOcorrencias o
INNER JOIN tbBPM b ON o.codBPM = b.codBPM
INNER JOIN tbDP d ON o.codDP = d.codDP
WHERE o.ocorrencia LIKE '%Roubo%'
GROUP BY d.nmDP
HAVING AVG(o.qtde) > (
    SELECT AVG(i.qtde)
    FROM tbRegOcorrencias i
    WHERE i.ocorrencia LIKE '%Roubo%'
)
ORDER BY AVG(o.qtde) DESC

-- total de ocorrências de roubo por distrito policial e classificando os distritos com base na quantidade total de ocorrências de roubo.

SELECT DP.nmDP AS NomeDistritoPolicial, 
    SUM(o.qtde) AS TotalOcorrenciasRoubo,
    ROW_NUMBER() OVER (ORDER BY SUM(o.qtde) DESC) AS Classificacao
FROM tbRegOcorrencias o
INNER JOIN tbDP DP ON o.codDP = DP.codDP
WHERE o.ocorrencia LIKE '%Roubo%'
GROUP BY DP.nmDP
ORDER BY Classificacao;

-- Métrica de Ocorrências de Roubo em Dois Períodos

SELECT 'Período - 2018 á 2019' AS Periodo, COUNT(*) AS TotalOcorrencias
FROM tbRegOcorrencias o
WHERE o.ano BETWEEN '2018' AND '2019' AND o.ocorrencia like '%Roubo%'
UNION
SELECT 'Período - 2020 á 2021' AS Periodo, COUNT(*) AS TotalOcorrencias
FROM tbRegOcorrencias i
WHERE i.ano BETWEEN '2020' AND '2021' AND i.ocorrencia like '%Roubo%';


-- Métrica de Tipos de Ocorrências Comuns entre Dois Municípios

SELECT o1.ocorrencia AS TipoDeOcorrenciaComum
FROM tbRegOcorrencias o1
INNER JOIN tbDP b1 ON o1.codDP = b1.codDP
INNER JOIN tbMunicipios m1 ON o1.codMunicIBGE = m1.codMunicIBGE
WHERE m1.nomeMunicipio like '%Rio de Janeiro%'
INTERSECT
SELECT o2.ocorrencia AS TipoDeOcorrenciaComum
FROM tbRegOcorrencias o2
INNER JOIN tbDP b2 ON o2.codDP = b2.codDP
INNER JOIN tbMunicipios m2 ON o2.codMunicIBGE = m2.codMunicIBGE
WHERE m2.nomeMunicipio like '%Niteroi%'
