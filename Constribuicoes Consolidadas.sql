--USE WIIZIAUDITORDB_AUDITORTESTE
SELECT lota.CodigoLotacao,dcd.Codigo, SUM (contrib.BaseCalculoConsolidada) AS 'Base', contrib.PercentualRecalculo,SUM (contrib.ValorCsConsolidadaPorEstabelecimento) AS 'Valor'
  
  FROM CabecalhosRecalculoCreditoInssESocial cabe
  JOIN EstabelecimentosRecalculoCreditoInssESocial estab ON cabe.CabecalhoRecalculoCreditoInssESocialId = estab.CabecalhoRecalculoCreditoInssESocialId
  JOIN LotacoesRecalculoCreditoInssESocial lota ON estab.EstabelecimentoRecalculoCreditoInssESocialId = lota.EstabelecimentoRecalculoCreditoInssESocialId
  JOIN ContribuicoesConsolidadaEstabelecimentoRecalculoCreditoInssESocial contrib ON lota.LotacaoRecalculoCreditoInssESocialId = contrib.LotacaoRecalculoCreditoInssESocialId
  JOIN DefCodigoDarf dcd ON contrib.CodigoDarfId = dcd.CodigoDarfId

  WHERE EmpresaId = '19e3ae60-c70c-4355-b4a6-5eaafc88e995' -- CARUARU
  AND contrib.PeriodoApuracao >= '2018-12-01' AND contrib.PeriodoApuracao < '2019-01-01' 
  AND contrib.ValorCsConsolidadaPorEstabelecimento > 0
  AND contrib.CodigoDarfId = 61

  GROUP BY lota.CodigoLotacao,dcd.Codigo,contrib.PercentualRecalculo
  ORDER BY lota.CodigoLotacao,dcd.Codigo

