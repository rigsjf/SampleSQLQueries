--SELECT * FROM DefDetalhePercentualTerceirosESocial ddpte
--  SELECT * FROM DefPercentualTerceirosESocial dpte
    SELECT ddpte.CodigoDarfId,dcd.Codigo,ddpte.CodigoTerceiros,ddpte.Aliquota FROM DefComposicaoTerceirosESocial dcte
      JOIN DefDetalhePercentualTerceirosESocial ddpte ON dcte.DetalhePercentualTerceiroESocialId = ddpte.DetalhePercentualTerceirosESocialId
      JOIN DefCodigoDarf dcd ON ddpte.CodigoDarfId = dcd.CodigoDarfId
    WHERE dcte.PercentualTerceirosESocialId IN (SELECT lrcie.PercentualTerceirosESocialId FROM CabecalhosRecalculoCreditoInssESocial crcie
      JOIN EstabelecimentosRecalculoCreditoInssESocial ercie ON crcie.CabecalhoRecalculoCreditoInssESocialId = ercie.CabecalhoRecalculoCreditoInssESocialId
      JOIN LotacoesRecalculoCreditoInssESocial lrcie ON ercie.EstabelecimentoRecalculoCreditoInssESocialId = lrcie.EstabelecimentoRecalculoCreditoInssESocialId
      WHERE crcie.EmpresaId = '29e2b142-7e35-41ea-b31d-03232bcdd07c' -- AUDITORTESTE	06350074000134	RDJ ASSESSORIA E GESTAO EMPRESARIAL EIRELI
      AND crcie.DataInicial = '2019-04-01')
      AND dcte.InicioValidade <= '2019-04-01' AND dcte.FimValidade > '2019-04-01' OR dcte.FimValidade IS null