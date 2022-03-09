USE WIIZIAUDITORDB_SUPERMAIS
SELECT 
  rem.Cpf,
  ees.CodigoRubrica AS 'Código Rubrica', eves.DescricaoRubrica AS 'Descrição rubrica', dnre.Codigo + ' - ' + dnre.Descricao AS 'Categoria Rubrica',
  deftipo.Codigo + ' - ' + deftipo.DescricaoAbreviada AS 'Tipo', 
  CASE WHEN corpo.ESocialRubricaRetificadaId IS NOT NULL THEN dcitrpse.Codigo ELSE def.Codigo END AS 'Incidência',
  cat.Codigo AS 'Código da Categoria', SUM(corpo.ValorRubrica) AS 'Valor rubrica',
  CASE WHEN corpo.BaseNegativa = 0 THEN 'Não' ELSE 'Sim' END AS 'Base Zerada',rem.RemuneracaoRecalculoCreditoInssESocialId,rem.NumeroReciboEventoOrigem,eves.DataProcessamento

  FROM CabecalhosRecalculoCreditoInssESocial cabe
  JOIN RemuneracoesRecalculoCreditoInssESocial rem ON cabe.CabecalhoRecalculoCreditoInssESocialId = rem.CabecalhoRecalculoCreditoInssESocialId
  JOIN CorposRemuneracaoRecalculoCreditoInssESocial corpo ON rem.RemuneracaoRecalculoCreditoInssESocialId = corpo.RemuneracaoRecalculoCreditoInssESocialId
  JOIN ESocialVigenciasEventoS1010 eves ON corpo.ESocialVigenciaEventoS1010Id = eves.ESocialVigenciaEventoS1010Id
  JOIN ESocialEventosS1010 ees ON eves.ESocialEventoS1010Id = ees.ESocialEventoS1010Id
  JOIN DefCodigoIncidenciaTribRubricaPrevSocialESocial def ON eves.CodigoIncidenciaTribRubricaPrevSocialESocialId = def.CodigoIncidenciaTribRubricaPrevSocialESocialId
  JOIN DefTipoRubricaESocial deftipo ON eves.TipoRubricaESocialId = deftipo.TipoRubricaESocialId
  JOIN DefCategoriaTrabalhadorESocial cat ON rem.CategoriaTrabalhadorESocialId = cat.CategoriaTrabalhadorESocialId
  JOIN DefNaturezaRubricaESocial dnre ON eves.NaturezaRubricaESocialId = dnre.NaturezaRubricaESocialId
  LEFT JOIN ESocialRubricasRetificadas err ON corpo.ESocialRubricaRetificadaId = err.ESocialRubricaRetificadaId
  LEFT JOIN DefTipoRubricaESocial dtre ON err.TipoRubricaESocialId = dtre.TipoRubricaESocialId
  LEFT JOIN DefCodigoIncidenciaTribRubricaPrevSocialESocial dcitrpse ON err.CodigoIncidenciaTribRubricaPrevSocialESocialId = dcitrpse.CodigoIncidenciaTribRubricaPrevSocialESocialId
  LEFT JOIN DefFinanciamentoAposentadoriaEspecialTempoContribESocial dfaetce ON rem.FinanciamentoAposentadoriaEspecialTempoContribESocialId = dfaetce.FinanciamentoAposentadoriaEspecialTempoContribESocialId
    

  WHERE cabe.EmpresaId = '1c9b3b9e-f2a7-4879-9fe3-b14073ee2327' -- SUPERMAIS 26320119000135	SUPERMERCADO REI DO ARROZ LTDA
 AND rem.PeriodoApuracao >= '2020-12-01' AND rem.PeriodoApuracao < '2021-01-01'
  --AND rem.Cpf = '08281159740'
 --AND err.CodigoRubrica = 'F00026320119046PROV000'
  
  
  --AND corpo.ESocialRubricaRetificadaId IS NOT NULL
  
  GROUP BY  rem.Cpf,ees.CodigoRubrica, eves.DescricaoRubrica, dnre.Codigo, dnre.Descricao, deftipo.Codigo + ' - ' + deftipo.DescricaoAbreviada,  
  CASE WHEN corpo.ESocialRubricaRetificadaId IS NOT NULL THEN dcitrpse.Codigo ELSE def.Codigo END, cat.Codigo,
  CASE WHEN corpo.BaseNegativa = 0 THEN 'Não' ELSE 'Sim' END,rem.RemuneracaoRecalculoCreditoInssESocialId,rem.NumeroReciboEventoOrigem,eves.DataProcessamento

  ORDER BY rem.Cpf,deftipo.Codigo + ' - ' + deftipo.DescricaoAbreviada, ees.CodigoRubrica