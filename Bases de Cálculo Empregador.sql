USE WIIZIAUDITORDB_AUDITORTESTE
SELECT FORMAT(base.PeriodoApuracao, 'MM/yyyy') AS 'PeriodoApuracao',estab.NumeroInscricao AS 'Estabelecimento',lota.CodigoLotacao AS 'Lotacao',cat.Codigo AS 'Categoria',def.Codigo + ' - ' + def.DescricaoAbreviada AS 'Tipo Base',
  dises.Descricao AS 'Tipo 13 Salario', corpos.ValorBaseCalculo
  FROM CabecalhosRecalculoCreditoInssESocial cabe
  JOIN EstabelecimentosRecalculoCreditoInssESocial estab ON cabe.CabecalhoRecalculoCreditoInssESocialId = estab.CabecalhoRecalculoCreditoInssESocialId
  JOIN LotacoesRecalculoCreditoInssESocial lota ON estab.EstabelecimentoRecalculoCreditoInssESocialId = lota.EstabelecimentoRecalculoCreditoInssESocialId
  JOIN BasesCalculoRecalculoCreditoInssESocial base ON lota.LotacaoRecalculoCreditoInssESocialId = base.LotacaoRecalculoCreditoInssESocialId
  JOIN CorposBaseCalculoRecalculoCreditoInssESocial corpos ON base.BaseCalculoRecalculoCreditoInssESocialId = corpos.BaseCalculoRecalculoCreditoInssESocialId
  JOIN DefTipoValorApuracaoESocial def ON corpos.TipoValorApuracaoESocialId = def.TipoValorApuracaoESocialId
  JOIN DefCategoriaTrabalhadorESocial cat ON base.CategoriaTrabalhadorESocialId = cat.CategoriaTrabalhadorESocialId
  JOIN DefIndicativo13SalarioESocialS5001 dises ON corpos.Indicativo13SalarioESocialS5001Id = dises.Indicativo13SalarioESocialS5001Id

--WHERE cabe.EmpresaId = '346f0e40-39c4-4fc9-8330-a707074d8b62' --	24449225000198	UNIMED CARUARU COOPERATIVA DE TRABALHO MEDICO
  WHERE cabe.EmpresaId = '19e3ae60-c70c-4355-b4a6-5eaafc88e995' -- AUDITORTESTE 	24449225000198	UNIMED CARUARU COOPERATIVA DE TRABALHO MEDICO
       AND base.PeriodoApuracao >= '2019-08-01' AND base.PeriodoApuracao < '2019-09-01' 
  
  --AND cat.Codigo = '101'
  --AND cat.Codigo IN ('101', '103', '105', '106','107', '108', '111')
--AND corpos.TipoValorApuracaoESocialId IN (4, 8)
  --AND corpos.Indicativo13SalarioESocialS5001Id = 1

--GROUP BY cat.Codigo,corpos.TipoValorApuracaoESocialId,corpos.Indicativo13SalarioESocialS5001Id
ORDER BY base.PeriodoApuracao,estab.NumeroInscricao,lota.CodigoLotacao ,cat.Codigo, corpos.TipoValorApuracaoESocialId
  