
  USE WIIZIAUDITORDB_AUDITORTESTE
  SELECT ees1.NumeroInscricao,elts.CodigoLotacao ,ees1.AliquotaRatAjustada, ees1.Fap, ees1.AliquotaRatCnaePreponderante, SUM (ees1.Fap * ees1.AliquotaRatCnaePreponderante) AS 'FAP X RAT'
     FROM CabecalhosRecalculoCreditoInssESocial cabe
    JOIN ESocialEventosS5011 ees ON cabe.IdEventoS5011 = ees.IdEvento
    JOIN ESocialEstabelecimentosS5011 ees1 ON ees.ESocialEventoS5011Id = ees1.ESocialEventoS5011Id
    JOIN ESocialLotacoesTributariasS5011 elts ON ees1.ESocialEstabelecimentoS5011Id = elts.ESocialEstabelecimentoS5011Id
    JOIN ESocialBasesRemuneracoesS5011 ebrs ON elts.ESocialLotacaoTributariaS5011Id = ebrs.ESocialLotacaoTributariaS5011Id
    --JOIN DefIndicadorIncidenciaESocial diie O         N ebrs.IndicadorIncidenciaESocialId = diie.IndicadorIncidenciaESocialId
    JOIN DefCategoriaTrabalhadorESocial dcte ON ebrs.CategoriaTrabalhadorESocialId = dcte.CategoriaTrabalhadorESocialId
    --WHERE cabe.EmpresaId = '3e397c8a-5360-4190-b2b2-8ecf1a8f99c2' --	06350074000134	RDJ ASSESSORIA E GESTAO EMPRESARIAL EIRELI
        WHERE cabe.EmpresaId = '19e3ae60-c70c-4355-b4a6-5eaafc88e995' -- CARUARU
    AND cabe.DataInicial = '2018-09-01'
    --AND ees.IndicativoPeriodoApuracaoESocialId = 2
    AND dcte.Codigo = '103'
        GROUP BY ees1.NumeroInscricao,elts.CodigoLotacao ,ees1.AliquotaRatAjustada, ees1.Fap, ees1.AliquotaRatCnaePreponderante
    ORDER BY elts.CodigoLotacao