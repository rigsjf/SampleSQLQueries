--USE WIIZIAUDITORDB_AUDITORTESTE
SELECT  rem.Cpf,ees.CodigoRubrica AS 'Código Rubrica', eves.DescricaoRubrica AS 'Descrição Rubrica', deftipo.Codigo + '-' + deftipo.DescricaoAbreviada AS 'Tipo',
  def.Codigo AS 'Código Incidência', cat.Codigo AS 'Código da Categoria',corpo.ValorRubrica, rem.BaseNegativa,dfaetce.Codigo AS 'Fin Apos Esp',
  ees1.DataProcessamento AS 'Processamento S1200', eves.DataProcessamento AS 'Processamento S1010', eves.InicioValidade, eves.FimValidade,
  eves.NumeroRecibo AS 'Recibo S1010'
   
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
  
  
  WHERE cabe.EmpresaId = '19e3ae60-c70c-4355-b4a6-5eaafc88e995' -- CARUARU
  AND rem.PeriodoApuracao >= '2020-09-01' AND rem.PeriodoApuracao < '2020-10-01'
  --AND cat.Codigo = '101'
  AND rem.Cpf = '00763018422'
  --AND rem.BaseNegativa = 1
    AND ees.CodigoRubrica = '0041'
  
 
    --GROUP BY  rem.Cpf,ees.CodigoRubrica, eves.DescricaoRubrica, deftipo.Codigo + '-' + deftipo.DescricaoAbreviada, def.Codigo, cat.Codigo, Ees1.NumeroRecibo, rem.BaseNegativa,dfaetce.Codigo
  
 --ORDER BY Tipo,ees.CodigoRubrica