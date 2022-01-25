USE WIIZIAUDITORDB_AUDITORTESTE
SELECT  DISTINCT rem.PeriodoApuracao,rem.Cpf
   
  FROM CabecalhosRecalculoCreditoInssESocial cabe
  
  JOIN RemuneracoesRecalculoCreditoInssESocial rem ON cabe.CabecalhoRecalculoCreditoInssESocialId = rem.CabecalhoRecalculoCreditoInssESocialId
  JOIN CorposRemuneracaoRecalculoCreditoInssESocial corpo ON rem.RemuneracaoRecalculoCreditoInssESocialId = corpo.RemuneracaoRecalculoCreditoInssESocialId
  
  
  WHERE cabe.EmpresaId = '19e3ae60-c70c-4355-b4a6-5eaafc88e995' -- CARUARU
  AND rem.BaseNegativa = 1
  
 
  
 ORDER BY rem.PeriodoApuracao