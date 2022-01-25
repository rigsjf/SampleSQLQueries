--USE WIIZIAUDITORDB_AUDITORTESTE
SELECT  err.CodigoRubrica, deftipo.DescricaoAbreviada AS 'Tipo', def.Codigo, corpo.ValorRubrica AS 'Valor', rem.BaseNegativa
   
  FROM CabecalhosRecalculoCreditoInssESocial cabe
  
  JOIN RemuneracoesRecalculoCreditoInssESocial rem ON cabe.CabecalhoRecalculoCreditoInssESocialId = rem.CabecalhoRecalculoCreditoInssESocialId
  JOIN CorposRemuneracaoRecalculoCreditoInssESocial corpo ON rem.RemuneracaoRecalculoCreditoInssESocialId = corpo.RemuneracaoRecalculoCreditoInssESocialId
  JOIN ESocialRubricasRetificadas err ON corpo.ESocialRubricaRetificadaId = err.ESocialRubricaRetificadaId
  
--  JOIN ESocialVigenciasEventoS1010 eves ON corpo.ESocialVigenciaEventoS1010Id = eves.ESocialVigenciaEventoS1010Id
--  JOIN ESocialEventosS1010 ees ON eves.ESocialEventoS1010Id = ees.ESocialEventoS1010Id
  JOIN DefCodigoIncidenciaTribRubricaPrevSocialESocial def ON err.CodigoIncidenciaTribRubricaPrevSocialESocialId = def.CodigoIncidenciaTribRubricaPrevSocialESocialId
  JOIN DefTipoRubricaESocial deftipo ON err.TipoRubricaESocialId = deftipo.TipoRubricaESocialId
  JOIN DefCategoriaTrabalhadorESocial cat ON rem.CategoriaTrabalhadorESocialId = cat.CategoriaTrabalhadorESocialId
  
    WHERE cabe.EmpresaId = 'fc5eadbd-3b28-46a7-bb9a-2fc8edf76cf9'
  AND rem.PeriodoApuracao >= '2018-10-01' AND rem.PeriodoApuracao < '2018-11-01'
 AND rem.BaseNegativa = 1
  AND rem.Cpf = '04673033639'