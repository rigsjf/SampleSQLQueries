--USE WIIZIAUDITORDB_NS
--USE WIIZIAUDITORDB_FISCOPLAN
  --USE WIIZIAUDITORDB_AUDITORTESTE

SELECT 
  darf.CodigoDarfId,darf.Codigo, creditos.ValorConsolidadoCodigoReceitaRecalculo,creditos.ValorConsolidadoCodigoReceitaESocial,creditos.AliquotaRatAjustada,
  estab.NumeroInscricao,creditos.ValorCreditoPorCodigoReceita
  
  
  FROM CabecalhosRecalculoCreditoInssESocial cabe
JOIN  CreditosRecalculoCreditoInssESocial creditos ON cabe.CabecalhoRecalculoCreditoInssESocialId = creditos.CabecalhoRecalculoCreditoInssESocialId
  JOIN DefCodigoDarf darf ON creditos.CodigoDarfId = darf.CodigoDarfId
JOIN EstabelecimentosRecalculoCreditoInssESocial estab ON cabe.CabecalhoRecalculoCreditoInssESocialId = estab.CabecalhoRecalculoCreditoInssESocialId
--WHERE cabe.EmpresaId = '19e3ae60-c70c-4355-b4a6-5eaafc88e995' -- CARUARU
--WHERE EmpresaId = '29e2b142-7e35-41ea-b31d-03232bcdd07c' --	AUDITORTESTE 06350074000134	RDJ ASSESSORIA E GESTAO EMPRESARIAL EIRELI
--WHERE EmpresaId = '3e397c8a-5360-4190-b2b2-8ecf1a8f99c2' -- NS	06350074000134	RDJ ASSESSORIA E GESTAO EMPRESARIAL EIRELI
    WHERE EmpresaId = 'd2c998fa-b5ad-4fd1-96f7-d5eb939157d5'	--33331919000117	POSTO DE GASOLINA SUL AMERICA LTDA
    AND creditos.PeriodoApuracao >= '2019-04-01' AND creditos.PeriodoApuracao < '2019-05-01'

  ORDER BY creditos.CodigoDarfId
  