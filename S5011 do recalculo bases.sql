USE WIIZIAUDITORDB_AUDITORTESTE

  SELECT FORMAT (cabe.DataInicial, 'MM/yyyy') AS 'PeriodoApuracao', ees1.NumeroInscricao AS 'Estabelecimento',elts.CodigoLotacao AS 'Lotacao' ,dcte.Codigo,
    ebrs.BaseCalculoCpNormal,ebrs.BaseCalculoCpAposEspecial15Anos,ebrs.BaseCalculoCpAposEspecial20Anos ,ebrs.BaseCalculoCpAposEspecial25Anos,
    cabe.NumeroReciboBaseS1299, cabe.IdEventoS5011
    
    FROM CabecalhosRecalculoCreditoInssESocial cabe
    JOIN ESocialEventosS5011 ees ON cabe.IdEventoS5011 = ees.IdEvento
    JOIN ESocialEstabelecimentosS5011 ees1 ON ees.ESocialEventoS5011Id = ees1.ESocialEventoS5011Id
    JOIN ESocialLotacoesTributariasS5011 elts ON ees1.ESocialEstabelecimentoS5011Id = elts.ESocialEstabelecimentoS5011Id
    JOIN ESocialBasesRemuneracoesS5011 ebrs ON elts.ESocialLotacaoTributariaS5011Id = ebrs.ESocialLotacaoTributariaS5011Id
    --JOIN DefIndicadorIncidenciaESocial diie O         N ebrs.IndicadorIncidenciaESocialId = diie.IndicadorIncidenciaESocialId
    JOIN DefCategoriaTrabalhadorESocial dcte ON ebrs.CategoriaTrabalhadorESocialId = dcte.CategoriaTrabalhadorESocialId
    
    WHERE cabe.EmpresaId = '19e3ae60-c70c-4355-b4a6-5eaafc88e995' -- AUDITORTESTE 	24449225000198	UNIMED CARUARU COOPERATIVA DE TRABALHO MEDICO
    --AND ees.NumeroReciboBase = '1.1.0000000005636210521'
    AND cabe.DataInicial = '2019-04-01'
    --AND ees.IndicativoPeriodoApuracaoESocialId = 2
    --AND dcte.Codigo = '103'
 
    ORDER BY dcte.Codigo