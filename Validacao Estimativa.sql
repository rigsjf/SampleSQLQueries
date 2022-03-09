USE WIIZIAUDITORDB_KRAFT
SELECT SUM(celrcie.ValorCodigoOriginal - celrcie.ValorCodigoRecalculo) FROM CreditosEstabelecimentosLotacoesRecalculoCreditoInssESocial celrcie
  JOIN CabecalhosRecalculoCreditoInssESocial crcie ON celrcie.CabecalhoRecalculoCreditoInssESocialId = crcie.CabecalhoRecalculoCreditoInssESocialId
  WHERE EmpresaId = '17307852-46e9-45b9-9c4f-ac4ec3e7cf33' --	AUDITORTESTE	41676370000120	MCF CONSTRUTORA LTDA
  AND crcie.DataInicial >= '2019-05-01' AND crcie.DataInicial < '2020-06-01'

  SELECT COUNT (crcie.CabecalhoRecalculoCreditoInssESocialId) AS 'quantidadeCompetenciasTratada' FROM CabecalhosRecalculoCreditoInssESocial crcie
    WHERE EmpresaId = '17307852-46e9-45b9-9c4f-ac4ec3e7cf33' --	AUDITORTESTE	41676370000120	MCF CONSTRUTORA LTDA
  AND crcie.DataInicial >= '2019-05-01' AND crcie.DataInicial < '2020-06-01'

  SELECT FORMAT (crcie.DataInicial, 'MM/yyyy') AS 'Competência', SUM(crrcie.ValorRubrica) AS 'Total proventos' FROM CorposRemuneracaoRecalculoCreditoInssESocial crrcie
  JOIN RemuneracoesRecalculoCreditoInssESocial rrcie ON crrcie.RemuneracaoRecalculoCreditoInssESocialId = rrcie.RemuneracaoRecalculoCreditoInssESocialId
  JOIN CabecalhosRecalculoCreditoInssESocial crcie ON rrcie.CabecalhoRecalculoCreditoInssESocialId = crcie.CabecalhoRecalculoCreditoInssESocialId
  JOIN ESocialVigenciasEventoS1010 eves ON crrcie.ESocialVigenciaEventoS1010Id = eves.ESocialVigenciaEventoS1010Id
  WHERE EmpresaId = '17307852-46e9-45b9-9c4f-ac4ec3e7cf33' --	AUDITORTESTE	41676370000120	MCF CONSTRUTORA LTDA
  AND crcie.DataInicial >= '2019-05-01' AND crcie.DataInicial < '2020-06-01'
  AND eves.TipoRubricaESocialId = 1
  GROUP BY crcie.DataInicial
  ORDER BY crcie.DataInicial

    SELECT SUM(celrcie.ValorCodigoOriginal) AS 'Guia'FROM CreditosEstabelecimentosLotacoesRecalculoCreditoInssESocial celrcie
  JOIN CabecalhosRecalculoCreditoInssESocial crcie ON celrcie.CabecalhoRecalculoCreditoInssESocialId = crcie.CabecalhoRecalculoCreditoInssESocialId
  WHERE EmpresaId = '17307852-46e9-45b9-9c4f-ac4ec3e7cf33' --	AUDITORTESTE	41676370000120	MCF CONSTRUTORA LTDA
  AND crcie.DataInicial >= '2019-05-01' AND crcie.DataInicial < '2020-06-01'

  SELECT format (crcie.DataInicial, 'MM/yyyy') AS 'Competências' FROM CabecalhosRecalculoCreditoInssESocial crcie
    WHERE EmpresaId = '17307852-46e9-45b9-9c4f-ac4ec3e7cf33' --	AUDITORTESTE	41676370000120	MCF CONSTRUTORA LTDA
  AND crcie.DataInicial >= '2019-05-01' AND crcie.DataInicial < '2020-06-01'
    ORDER BY crcie.DataInicial