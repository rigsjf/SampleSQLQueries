--USE WIIZIAUDITORDB_AUDITORTESTE
  --USE WIIZIAUDITORDB_FISCOPLAN
SELECT cat.Codigo,corpo.TipoValorApuracaoESocialId ,SUM(corpo.ValorBaseCalculo) AS 'Valor'
  
  FROM CabecalhosRecalculoCreditoInssESocial cabe
  JOIN EstabelecimentosRecalculoCreditoInssESocial estab ON cabe.CabecalhoRecalculoCreditoInssESocialId = estab.CabecalhoRecalculoCreditoInssESocialId
  JOIN LotacoesRecalculoCreditoInssESocial lota ON estab.EstabelecimentoRecalculoCreditoInssESocialId = lota.EstabelecimentoRecalculoCreditoInssESocialId
  JOIN BasesCalculoRecalculoCreditoInssESocial base ON lota.LotacaoRecalculoCreditoInssESocialId = base.LotacaoRecalculoCreditoInssESocialId
  JOIN CorposBaseCalculoRecalculoCreditoInssESocial corpo ON base.BaseCalculoRecalculoCreditoInssESocialId = corpo.BaseCalculoRecalculoCreditoInssESocialId
  JOIN DefCategoriaTrabalhadorESocial cat ON base.CategoriaTrabalhadorESocialId = cat.CategoriaTrabalhadorESocialId

  WHERE EmpresaId = '19e3ae60-c70c-4355-b4a6-5eaafc88e995' -- CARUARU
  --WHERE EmpresaId = 'd2c998fa-b5ad-4fd1-96f7-d5eb939157d5' --	33331919000117	POSTO DE GASOLINA SUL AMERICA LTDA
  AND base.PeriodoApuracao >= '2019-12-01' AND base.PeriodoApuracao < '2020-01-01' 
  --AND lota.CodigoLotacao = '04'
  --AND cat.Codigo = '101'
  --AND corpo.TipoValorApuracaoESocialId IN (1,2,3,4,5,6,7,8,32,33,34,35,36,37,38,39)
    AND corpo.TipoValorApuracaoESocialId != 10

  GROUP BY cat.Codigo,corpo.TipoValorApuracaoESocialId
ORDER BY cat.Codigo
  