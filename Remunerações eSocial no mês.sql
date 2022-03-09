USE WIIZIAUDITORDB_AUDITORTESTE
SELECT 
  rem.Cpf,ees.CodigoRubrica AS 'Código Rubrica', eves.DescricaoRubrica AS 'Descrição Rubrica', deftipo.Codigo + ' - ' + deftipo.DescricaoAbreviada AS 'Tipo', 
  def.Codigo AS 'Código Incidência', dtre.Codigo + ' - ' + dtre.DescricaoAbreviada AS 'Tipo Retificada', dcitrpse.Codigo AS 'Incidencia Retificada',
  cat.Codigo AS 'Código da Categoria',  dfaetce.Codigo AS 'FinAposentadoriaEspecial', corpo.ValorRubrica,  corpo.BaseNegativa,REM.NumeroReciboEventoOrigem,
  ees1.DataProcessamento,ees2.DataProcessamento
  
  
  FROM CabecalhosRecalculoCreditoInssESocial cabe
  JOIN RemuneracoesRecalculoCreditoInssESocial rem ON cabe.CabecalhoRecalculoCreditoInssESocialId = rem.CabecalhoRecalculoCreditoInssESocialId
  JOIN LotacoesRecalculoCreditoInssESocial lrcie ON rem.LotacaoRecalculoCreditoInssESocialId = lrcie.LotacaoRecalculoCreditoInssESocialId
  JOIN EstabelecimentosRecalculoCreditoInssESocial ercie ON lrcie.EstabelecimentoRecalculoCreditoInssESocialId = ercie.EstabelecimentoRecalculoCreditoInssESocialId
  JOIN CorposRemuneracaoRecalculoCreditoInssESocial corpo ON rem.RemuneracaoRecalculoCreditoInssESocialId = corpo.RemuneracaoRecalculoCreditoInssESocialId
  JOIN ESocialVigenciasEventoS1010 eves ON corpo.ESocialVigenciaEventoS1010Id = eves.ESocialVigenciaEventoS1010Id
  JOIN ESocialEventosS1010 ees ON eves.ESocialEventoS1010Id = ees.ESocialEventoS1010Id
  JOIN DefCodigoIncidenciaTribRubricaPrevSocialESocial def ON eves.CodigoIncidenciaTribRubricaPrevSocialESocialId = def.CodigoIncidenciaTribRubricaPrevSocialESocialId
  JOIN DefTipoRubricaESocial deftipo ON eves.TipoRubricaESocialId = deftipo.TipoRubricaESocialId
  JOIN DefCategoriaTrabalhadorESocial cat ON rem.CategoriaTrabalhadorESocialId = cat.CategoriaTrabalhadorESocialId
  LEFT JOIN ESocialRubricasRetificadas err ON corpo.ESocialRubricaRetificadaId = err.ESocialRubricaRetificadaId
  LEFT JOIN DefTipoRubricaESocial dtre ON err.TipoRubricaESocialId = dtre.TipoRubricaESocialId
  LEFT JOIN DefCodigoIncidenciaTribRubricaPrevSocialESocial dcitrpse ON err.CodigoIncidenciaTribRubricaPrevSocialESocialId = dcitrpse.CodigoIncidenciaTribRubricaPrevSocialESocialId
  LEFT JOIN DefFinanciamentoAposentadoriaEspecialTempoContribESocial dfaetce ON rem.FinanciamentoAposentadoriaEspecialTempoContribESocialId = dfaetce.FinanciamentoAposentadoriaEspecialTempoContribESocialId
  LEFT JOIN ESocialEventosS1200 ees1 ON rem.ESocialEventoS1200Id = ees1.ESocialEventoS1200Id
  LEFT JOIN ESocialEventosS2299 ees2 ON rem.ESocialEventoS2299Id = ees2.ESocialEventoS2299Id

    WHERE cabe.EmpresaId = '29e2b142-7e35-41ea-b31d-03232bcdd07c' -- AUDITORTESTE	06350074000134	RDJ ASSESSORIA E GESTAO EMPRESARIAL EIRELI
  AND rem.PeriodoApuracao >= '2019-05-01' AND rem.PeriodoApuracao < '2019-06-01'
  AND rem.Cpf = '00343211106'
  --AND eves.CodigoIncidenciaTribRubricaPrevSocialESocialId IN (21, 22, 23, 24, 25, 26, 27, 28, 29)
   -- GROUP BY  rem.Cpf,ees.CodigoRubrica, eves.DescricaoRubrica, deftipo.Codigo + ' - ' + deftipo.DescricaoAbreviada, def.CodigoIncidenciaTribRubricaPrevSocialESocialId,
--  def.Codigo, cat.Codigo,rem.FinanciamentoAposentadoriaEspecialTempoContribESocialId,rem.BaseNegativa,REM.NumeroReciboEventoOrigem,rem.RemuneracaoRecalculoCreditoInssESocialId
--  
 ORDER BY REM.NumeroReciboEventoOrigem,rem.Cpf,deftipo.Codigo + ' - ' + deftipo.DescricaoAbreviada,ees.CodigoRubrica,def.CodigoIncidenciaTribRubricaPrevSocialESocialId
  --REM.NumeroReciboEventoOrigem,rem.Cpf,deftipo.Codigo + ' - ' + deftipo.DescricaoAbreviada,ees.CodigoRubrica,def.CodigoIncidenciaTribRubricaPrevSocialESocialId