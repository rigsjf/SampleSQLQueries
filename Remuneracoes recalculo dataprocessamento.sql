--USE WIIZIAUDITORDB_AUDITORTESTE
SELECT  rem.Cpf,ees.CodigoRubrica AS 'Código Rubrica', eves.DescricaoRubrica AS 'Descrição Rubrica', deftipo.Codigo + '-' + deftipo.DescricaoAbreviada AS 'Tipo', def.Codigo AS 'Código Incidência', cat.Codigo AS 'Código da Categoria',SUM (corpo.ValorRubrica) AS 'Valor', Ees1.NumeroRecibo, rem.BaseNegativa,dfaetce.Codigo AS 'Fin Apos Esp',ees1.DataProcessamento
   
  FROM CabecalhosRecalculoCreditoInssESocial cabe
  
  JOIN RemuneracoesRecalculoCreditoInssESocial rem ON cabe.CabecalhoRecalculoCreditoInssESocialId = rem.CabecalhoRecalculoCreditoInssESocialId
  JOIN CorposRemuneracaoRecalculoCreditoInssESocial corpo ON rem.RemuneracaoRecalculoCreditoInssESocialId = corpo.RemuneracaoRecalculoCreditoInssESocialId
  JOIN ESocialVigenciasEventoS1010 eves ON corpo.ESocialVigenciaEventoS1010Id = eves.ESocialVigenciaEventoS1010Id
  JOIN ESocialEventosS1010 ees ON eves.ESocialEventoS1010Id = ees.ESocialEventoS1010Id
  JOIN DefCodigoIncidenciaTribRubricaPrevSocialESocial def ON eves.CodigoIncidenciaTribRubricaPrevSocialESocialId = def.CodigoIncidenciaTribRubricaPrevSocialESocialId
  JOIN DefTipoRubricaESocial deftipo ON eves.TipoRubricaESocialId = deftipo.TipoRubricaESocialId
  JOIN DefCategoriaTrabalhadorESocial cat ON rem.CategoriaTrabalhadorESocialId = cat.CategoriaTrabalhadorESocialId
  JOIN ESocialEventosS1200 ees1 ON rem.ESocialEventoS1200Id = ees1.ESocialEventoS1200Id
  JOIN DefFinanciamentoAposentadoriaEspecialTempoContribESocial dfaetce ON rem.FinanciamentoAposentadoriaEspecialTempoContribESocialId = dfaetce.FinanciamentoAposentadoriaEspecialTempoContribESocialId
  JOIN ESocialEventosS1299 ees2 ON ees2.NumeroRecibo = cabe.NumeroReciboBaseS1299
  
  
  --WHERE cabe.EmpresaId = '19e3ae60-c70c-4355-b4a6-5eaafc88e995' -- CARUARU
  WHERE cabe.EmpresaId = 'fdc00d04-1dec-43f5-8acf-3e5ff13c5200' -- KRAFT	26189530000113	UNIMED CURVELO COOPERATIVA DE TRABALHO MEDICO LTDA
  AND rem.PeriodoApuracao >= '2021-11-01' AND rem.PeriodoApuracao < '2021-12-01'
  AND cat.Codigo = '722'
  --AND rem.Cpf = '00763018422'
  --AND rem.BaseNegativa = 1
  AND ees1.DataProcessamento > ees2.DataProcessamento
 
    GROUP BY  rem.Cpf,ees.CodigoRubrica, eves.DescricaoRubrica, deftipo.Codigo + '-' + deftipo.DescricaoAbreviada, def.Codigo, cat.Codigo, Ees1.NumeroRecibo, rem.BaseNegativa,dfaetce.Codigo,ees1.DataProcessamento
  
 ORDER BY Tipo,ees.CodigoRubrica