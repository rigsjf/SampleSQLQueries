--USE WIIZIAUDITORDB_AUDITORTESTE
  SELECT DISTINCT ddpte.CodigoTerceiros, ddpte.Aliquota,dcd.CodigoDarfId
FROM CabecalhosRecalculoCreditoInssESocial cabe
JOIN EstabelecimentosRecalculoCreditoInssESocial ercie ON cabe.CabecalhoRecalculoCreditoInssESocialId = ercie.CabecalhoRecalculoCreditoInssESocialId
    JOIN LotacoesRecalculoCreditoInssESocial lrcie ON ercie.EstabelecimentoRecalculoCreditoInssESocialId = lrcie.EstabelecimentoRecalculoCreditoInssESocialId
JOIN DefComposicaoTerceirosESocial def ON lrcie.PercentualTerceirosESocialId = def.PercentualTerceirosESocialId
    JOIN DefDetalhePercentualTerceirosESocial ddpte ON def.DetalhePercentualTerceiroESocialId = ddpte.DetalhePercentualTerceirosESocialId
    JOIN DefCodigoDarf dcd ON ddpte.CodigoDarfId = dcd.CodigoDarfId
            WHERE cabe.EmpresaId = '19e3ae60-c70c-4355-b4a6-5eaafc88e995' -- CARUARU


