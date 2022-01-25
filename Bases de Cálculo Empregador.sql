--USE WIIZIAUDITORDB_AUDITORTESTE
  --USE WIIZIAUDITORDB_FISCOPLAN

SELECT cat.Codigo,corpos.TipoValorApuracaoESocialId,corpos.Indicativo13SalarioESocialS5001Id, SUM(corpos.ValorBaseCalculo) AS 'Valor'
  FROM CabecalhosRecalculoCreditoInssESocial cabe
  JOIN EstabelecimentosRecalculoCreditoInssESocial estab ON cabe.CabecalhoRecalculoCreditoInssESocialId = estab.CabecalhoRecalculoCreditoInssESocialId
  JOIN LotacoesRecalculoCreditoInssESocial lota ON estab.EstabelecimentoRecalculoCreditoInssESocialId = lota.EstabelecimentoRecalculoCreditoInssESocialId
  JOIN BasesCalculoRecalculoCreditoInssESocial base ON lota.LotacaoRecalculoCreditoInssESocialId = base.LotacaoRecalculoCreditoInssESocialId
  JOIN CorposBaseCalculoRecalculoCreditoInssESocial corpos ON base.BaseCalculoRecalculoCreditoInssESocialId = corpos.BaseCalculoRecalculoCreditoInssESocialId
  JOIN DefTipoValorApuracaoESocial def ON corpos.TipoValorApuracaoESocialId = def.TipoValorApuracaoESocialId
  JOIN DefCategoriaTrabalhadorESocial cat ON base.CategoriaTrabalhadorESocialId = cat.CategoriaTrabalhadorESocialId

WHERE cabe.EmpresaId = '19e3ae60-c70c-4355-b4a6-5eaafc88e995' --24449225000198	UNIMED CARUARU COOPERATIVA DE TRABALHO MEDICO
    --WHERE EmpresaId = '8f116d2a-9c7f-46ea-b9b6-f483aaa20ec5' --	05234289000127	BEST VIGILANCIA E SEGURANCA LTDA	BEST VIGILANCIA E SEGURANCA LTDA
  --WHERE EmpresaId = 'd2c998fa-b5ad-4fd1-96f7-d5eb939157d5'	--33331919000117	POSTO DE GASOLINA SUL AMERICA LTDA
  AND PeriodoApuracao >= '2018-09-01' AND PeriodoApuracao < '2018-10-01'
  --AND cat.Codigo = '101'
  --AND cat.Codigo IN ('101', '103', '105', '106','107', '108', '111')
AND corpos.TipoValorApuracaoESocialId != 10
  --AND corpos.Indicativo13SalarioESocialS5001Id = 1

GROUP BY cat.Codigo,corpos.TipoValorApuracaoESocialId,corpos.Indicativo13SalarioESocialS5001Id

  SELECT * FROM DefIndicativo13SalarioESocialS5001