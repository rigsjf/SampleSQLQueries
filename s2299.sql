--USE WIIZIAUDITORDB_AUDITORTESTE
  SELECT 
edvrs.CodigoRubrica, edvrs.ValorRubrica, ees.Cpf, ees.DataDesligamento, edvds.ESocialDemonstrativoValorDevidoS2299Id,ees.NumeroRecibo, eccfs.IdConsignadoFgts,eccfs.MatriculaInstituicaoConsignataria

     FROM ESocialEventosS2299 ees
    JOIN ESocialDemonstrativosValoresDevidosS2299 edvds ON ees.ESocialEventoS2299Id = edvds.ESocialEventoS2299Id
    JOIN ESocialEstabelecimentosLotacoesS2299 eels ON edvds.ESocialDemonstrativoValorDevidoS2299Id = eels.ESocialDemonstrativoValorDevidoS2299Id
    JOIN ESocialDetalhamentosVerbasRescisoriasS2299 edvrs ON eels.ESocialEstabelecimentoLotacaoS2299Id = edvrs.ESocialEstabelecimentoLotacaoS2299Id
    JOIN ESocialCreditosConsignadosFgtsS2299 eccfs ON ees.ESocialEventoS2299Id = eccfs.ESocialEventoS2299Id


WHERE ees.EmpresaId = '19e3ae60-c70c-4355-b4a6-5eaafc88e995' -- CARUARU
    --WHERE ees.EmpresaId = 'fc5eadbd-3b28-46a7-bb9a-2fc8edf76cf9'
    --AND edvrs.CodigoRubrica = '2301D'
    --AND ees.Cpf = '09698010416'
   AND ees.DataDesligamento >= '2018-05-01' AND ees.DataDesligamento < '2018-06-01'