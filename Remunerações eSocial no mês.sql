--USE WIIZIAUDITORDB_FISCOPLAN
--USE WIIZIAUDITORDB_KRAFT
--USE WIIZIAUDITORDB_AUDITORTESTE
SELECT  rem.Cpf,ees.CodigoRubrica AS 'Código Rubrica', eves.DescricaoRubrica AS 'Descrição Rubrica', deftipo.Codigo + '-' + deftipo.DescricaoAbreviada AS 'Tipo', 
  def.CodigoIncidenciaTribRubricaPrevSocialESocialId AS 'Def ID',def.Codigo AS 'Código Incidência', cat.Codigo AS 'Código da Categoria',SUM (corpo.ValorRubrica) AS 'Valor',
  rem.FinanciamentoAposentadoriaEspecialTempoContribESocialId AS 'FinApos',rem.BaseNegativa,ees1.NumeroRecibo
     FROM CabecalhosRecalculoCreditoInssESocial cabe
    JOIN RemuneracoesRecalculoCreditoInssESocial rem ON cabe.CabecalhoRecalculoCreditoInssESocialId = rem.CabecalhoRecalculoCreditoInssESocialId
  JOIN CorposRemuneracaoRecalculoCreditoInssESocial corpo ON rem.RemuneracaoRecalculoCreditoInssESocialId = corpo.RemuneracaoRecalculoCreditoInssESocialId
  JOIN ESocialVigenciasEventoS1010 eves ON corpo.ESocialVigenciaEventoS1010Id = eves.ESocialVigenciaEventoS1010Id
  JOIN ESocialEventosS1010 ees ON eves.ESocialEventoS1010Id = ees.ESocialEventoS1010Id
--  JOIN ESocialRubricasRetificadas err ON corpo.ESocialRubricaRetificadaId = err.ESocialRubricaRetificadaId
  JOIN DefCodigoIncidenciaTribRubricaPrevSocialESocial def ON eves.CodigoIncidenciaTribRubricaPrevSocialESocialId = def.CodigoIncidenciaTribRubricaPrevSocialESocialId
  JOIN DefTipoRubricaESocial deftipo ON eves.TipoRubricaESocialId = deftipo.TipoRubricaESocialId
  JOIN DefCategoriaTrabalhadorESocial cat ON rem.CategoriaTrabalhadorESocialId = cat.CategoriaTrabalhadorESocialId
  JOIN ESocialEventosS1200 ees1 ON rem.ESocialEventoS1200Id = ees1.ESocialEventoS1200Id
  --JOIN ESocialEventosS2299 ees1 ON rem.ESocialEventoS2299Id = ees1.ESocialEventoS2299Id
  --JOIN ESocialEventosS2399 ees1 ON rem.ESocialEventoS2399Id = ees1.ESocialEventoS2399Id
  LEFT JOIN ESocialEventosS3000 ees2 ON ees2.NumeroReciboEventoExcluido = ees1.NumeroRecibo
  JOIN ESocialEventosS1299 ees3 ON cabe.NumeroReciboBaseS1299 = ees3.NumeroRecibo
    
  WHERE cabe.EmpresaId = '19e3ae60-c70c-4355-b4a6-5eaafc88e995' -- CARUARU
  --WHERE cabe.EmpresaId = 'f50006fd-a11c-4c84-a8b4-8ab442c4bed6'	-- 21032511000165	AUTO POSTO CORTEZ LTDA
  --  WHERE cabe.EmpresaId = '8f116d2a-9c7f-46ea-b9b6-f483aaa20ec5' --	05234289000127	BEST VIGILANCIA E SEGURANCA LTDA
  -- WHERE cabe.EmpresaId = 'b2e77dfa-8d71-4fdf-ab75-6ee434f01070' -- KRAFT	24014235000109	UNIMED DE SETE LAGOAS - COOPERATIVA TRABALHO MEDICO	MATRIZ
  AND rem.PeriodoApuracao >= '2018-10-01' AND rem.PeriodoApuracao < '2018-11-01'
    AND ees2.ESocialEventoS3000Id IS NULL
  --AND rem.Cpf = '07228632419'
 --AND rem.NumeroReciboEventoOrigem = '1.1.0000000006512847217'
 --AND def.Codigo IN ('91','92','93','94','95','96','97','98','99')
  AND cat.Codigo = '701'
  --AND rem.FinanciamentoAposentadoriaEspecialTempoContribESocialId = 4
  --AND rem.BaseNegativa = 0
  AND ees1.DataProcessamento > ees3.DataProcessamento
 GROUP BY  rem.Cpf,ees.CodigoRubrica, eves.DescricaoRubrica, deftipo.Codigo + '-' + deftipo.DescricaoAbreviada, def.CodigoIncidenciaTribRubricaPrevSocialESocialId,
  def.Codigo, cat.Codigo,rem.FinanciamentoAposentadoriaEspecialTempoContribESocialId,rem.BaseNegativa,ees1.NumeroRecibo
  
 ORDER BY rem.Cpf,def.CodigoIncidenciaTribRubricaPrevSocialESocialId,deftipo.Codigo + '-' + deftipo.DescricaoAbreviada,ees.CodigoRubrica