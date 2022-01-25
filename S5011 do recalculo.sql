USE WIIZIAUDITORDB_AUDITORTESTE
--USE WIIZIAUDITORDB_NS
    --SELECT DISTINCT ees1.AliquotaRatAjustada
  --SELECT dcte.Codigo, SUM (ebrs.BaseCalculoCpNormal) AS 'Base Normal',SUM (ebrs.BaseCalculoCpAposEspecial25Anos) AS 'Base 25'
    --SELECT dcte.Codigo, ebrs.BaseCalculoCpNormal,ebrs.BaseCalculoCpAposEspecial25Anos,elts.CodigoLotacao
  SELECT ees.PeriodoApuracao,ees.IndicativoPeriodoApuracaoESocialId, ees.IdEvento, ees.NumeroReciboBase

     FROM CabecalhosRecalculoCreditoInssESocial cabe
    JOIN ESocialEventosS5011 ees ON cabe.IdEventoS5011 = ees.IdEvento
    JOIN ESocialEstabelecimentosS5011 ees1 ON ees.ESocialEventoS5011Id = ees1.ESocialEventoS5011Id
    JOIN ESocialLotacoesTributariasS5011 elts ON ees1.ESocialEstabelecimentoS5011Id = elts.ESocialEstabelecimentoS5011Id
    JOIN ESocialBasesRemuneracoesS5011 ebrs ON elts.ESocialLotacaoTributariaS5011Id = ebrs.ESocialLotacaoTributariaS5011Id
    --JOIN DefIndicadorIncidenciaESocial diie ON ebrs.IndicadorIncidenciaESocialId = diie.IndicadorIncidenciaESocialId
    JOIN DefCategoriaTrabalhadorESocial dcte ON ebrs.CategoriaTrabalhadorESocialId = dcte.CategoriaTrabalhadorESocialId
    --WHERE ees.EmpresaId = '3e397c8a-5360-4190-b2b2-8ecf1a8f99c2' --	06350074000134	RDJ ASSESSORIA E GESTAO EMPRESARIAL EIRELI
        WHERE ees.EmpresaId = '19e3ae60-c70c-4355-b4a6-5eaafc88e995' -- CARUARU
  --  WHERE EmpresaId = '1c9b3b9e-f2a7-4879-9fe3-b14073ee2327' --REI DO ARROZ
    --  WHERE EmpresaId = 'fc5eadbd-3b28-46a7-bb9a-2fc8edf76cf9'
        --AND ees.NumeroReciboBase = '1.1.0000000005636210521'
    --AND cabe.DataInicial = '2018-08-01'
    AND ees.IndicativoPeriodoApuracaoESocialId = 2
    --AND dcte.Codigo = '101'
    
    --GROUP BY dcte.Codigo