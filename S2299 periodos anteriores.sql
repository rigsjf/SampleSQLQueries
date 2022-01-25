--USE WIIZIAUDITORDB_AUDITORTESTE
  SELECT 
eras.CodigoRubrica, eras.ValorRubrica

     FROM ESocialEventosS2299 ees
    JOIN ESocialDemonstrativosValoresDevidosS2299 edvds ON ees.ESocialEventoS2299Id = edvds.ESocialEventoS2299Id
JOIN ESocialConvencoesColetivasS2299 eccs ON edvds.ESocialDemonstrativoValorDevidoS2299Id = eccs.ESocialDemonstrativoValorDevidoS2299Id
    JOIN ESocialPeriodosReferenciasS2299 eprs ON eccs.ESocialConvencaoColetivaS2299Id = eprs.ESocialConvencaoColetivaS2299Id
JOIN ESocialEstabelecimentosLotacoesPeriodosAnterioresS2299 eelpas ON eprs.ESocialPeriodoReferenciaS2299Id = eelpas.ESocialPeriodoReferenciaS2299Id
    JOIN ESocialRemuneracoesAnterioresS2299 eras ON eelpas.ESocialEstabelecimentoLotacaoPeriodoAnteriorS2299Id = eras.ESocialEstabelecimentoLotacaoPeriodoAnteriorS2299Id

    WHERE ees.EmpresaId = 'fc5eadbd-3b28-46a7-bb9a-2fc8edf76cf9'
    --AND eras.CodigoRubrica = '2301D'
    AND ees.DataDesligamento >= '2018-10-01' AND ees.DataDesligamento < '2018-11-01'