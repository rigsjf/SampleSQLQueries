USE WIIZIAUDITORDB_AUDITORTESTE
  SELECT DISTINCT s1200.PeriodoApuracao
--eiras.CodigoRubrica, eiras.ValorRubrica

     FROM ESocialEventosS1200 s1200
    JOIN ESocialDemonstrativosValoresDevidosS1200 dem ON s1200.ESocialEventoS1200Id = dem.ESocialEventoS1200Id
   JOIN ESocialConvencoesColetivasS1200 eccs ON dem.ESocialDemonstrativoValoresDevidosS1200Id = eccs.ESocialDemonstrativoValoresDevidosS1200Id
    JOIN ESocialPeriodosReferenciasS1200 eprs ON eccs.ESocialConvencaoColetivaS1200Id = eprs.ESocialConvencaoColetivaS1200Id
    JOIN ESocialEstabelecimentosLotacoesPeriodosAnterioresS1200 eelpas ON eprs.ESocialPeriodoReferenciaS1200Id = eelpas.ESocialPeriodoReferenciaS1200Id
    JOIN ESocialRemuneracoesPeriodosAnterioresS1200 erpas ON eelpas.ESocialEstabelecimentoLotacaoPeriodoAnteriorS1200Id = erpas.ESocialEstabelecimentoLotacaoPeriodoAnteriorS1200Id
    JOIN ESocialItensRemuneracaoAnteriorS1200 eiras ON erpas.ESocialRemuneracaoPeriodoAnteriorS1200Id = eiras.ESocialRemuneracaoPeriodoAnteriorS1200Id
    JOIN Empresas e ON s1200.EmpresaId = e.EmpresaId

    WHERE s1200.EmpresaId = 'fc5eadbd-3b28-46a7-bb9a-2fc8edf76cf9'
    --AND eiras.CodigoRubrica = '2301D'
    --WHERE s1200.PeriodoApuracao >= '2018-10-01' AND s1200.PeriodoApuracao < '2018-11-01'
      AND eiras.ESocialItemRemuneracaoAnteriorS1200Id IS NOT NULL