--USE WIIZIAUDITORDB_KRAFT
--USE WIIZIAUDITORDB_FISCOPLAN
--USE WIIZIAUDITORDB_AUDITORTESTE
SELECT s5001.CpfTrabalhador,s5001.NumeroReciboArquivoBase, dtvae.Codigo + ' - ' + dtvae.DescricaoAbreviada AS 'Tipo Base', dises.Descricao AS 'Ind 13 Sal', SUM (eibcs.ValorBase) AS 'ValorBase'
     FROM ESocialEventosS5001 s5001 
    JOIN ESocialIdentificacoesEstabelecimentosS5001 eies ON s5001.ESocialEventoS5001Id = eies.ESocialEventoS5001Id
    JOIN ESocialInformacoesMatriculasS5001 eims ON eies.ESocialIdentificacaoEstabelecimentoS5001Id = eims.ESocialIdentificacaoEstabelecimentoS5001Id
    JOIN ESocialInformacoesBasesCalculosS5001 eibcs ON eims.ESocialInformacaoMatriculaS5001Id = eibcs.ESocialInformacaoMatriculaS5001Id
    JOIN DefCategoriaTrabalhadorESocial dcte ON eims.CategoriaTrabalhadorESocialId = dcte.CategoriaTrabalhadorESocialId
 JOIN ESocialEventosS1200 ees ON ees.NumeroRecibo = s5001.NumeroReciboArquivoBase
  --JOIN ESocialEventosS2299 ees ON ees.NumeroRecibo = s5001.NumeroReciboArquivoBase
--JOIN ESocialEventosS2399 ees ON dcte.CategoriaTrabalhadorESocialId = ees.CategoriaTrabalhadorESocialId
  LEFT JOIN ESocialEventosS3000 ees1 ON ees1.NumeroReciboEventoExcluido = ees.NumeroRecibo
  JOIN DefTipoValorApuracaoESocial dtvae ON eibcs.TipoValorApuracaoESocialId = dtvae.TipoValorApuracaoESocialId
  JOIN DefIndicativoPeriodoApuracaoESocial dipae ON s5001.IndicativoPeriodoApuracaoESocialId = dipae.IndicativoPeriodoApuracaoESocialId
  JOIN DefIndicativo13SalarioESocialS5001 dises ON eibcs.Indicativo13SalarioBaseESocialId = dises.Indicativo13SalarioESocialS5001Id
    
  --  WHERE s5001.EmpresaId = '19e3ae60-c70c-4355-b4a6-5eaafc88e995' -- AUDITORTESTE - CARUARU
--  WHERE s5001.EmpresaId = '8f116d2a-9c7f-46ea-b9b6-f483aaa20ec5' --	05234289000127	BEST VIGILANCIA E SEGURANCA LTDA
  --WHERE s5001.EmpresaId = 'b2e77dfa-8d71-4fdf-ab75-6ee434f01070' --KRAFT	24014235000109	UNIMED SETE LAGOAS COOPERATIVA DE TRABALHO MEDICO	UNIMED DE SETE LAGOAS - COOPERATIVA TRABALHO MEDICO	MATRIZ
  WHERE s5001.EmpresaId = 'fdc00d04-1dec-43f5-8acf-3e5ff13c5200' -- KRAFT	26189530000113	UNIMED CURVELO COOPERATIVA DE TRABALHO MEDICO LTDA
  
  AND s5001.PeriodoApuracao >= '2021-11-01' AND s5001.PeriodoApuracao < '2021-12-01'
  AND dcte.Codigo = '722'
AND eibcs.TipoValorApuracaoESocialId  NOT IN (10, 11, 12)
--  AND s5001.IndicativoPeriodoApuracaoESocialId = 1
  AND ees1.ESocialEventoS3000Id IS NULL
  --AND s5001.CpfTrabalhador = '32620390630'
  --AND eibcs.Indicativo13SalarioBaseESocialId = 2

GROUP BY s5001.CpfTrabalhador,s5001.NumeroReciboArquivoBase,dises.Descricao,dtvae.Codigo,dtvae.DescricaoAbreviada
ORDER BY s5001.CpfTrabalhador