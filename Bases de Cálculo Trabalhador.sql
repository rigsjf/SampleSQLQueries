USE WIIZIAUDITORDB_AUDITORTESTE
SELECT ercie.NumeroInscricao AS 'Estabelecimento',lrcie.CodigoLotacao AS 'Lotação',
  rem.Cpf,rem.NumeroReciboEventoOrigem,
  cat.Codigo AS 'Categoria',dtvae.Codigo + ' - ' + dtvae.DescricaoAbreviada AS 'Tipo Base',  dises.Descricao AS 'Ind 13 Sal',
  dcitrpse.Codigo + ' - ' + dcitrpse.DescricaoAbreviada AS 'Tipo Incidência' ,bases.ValorBaseCalculo
  FROM CabecalhosRecalculoCreditoInssESocial cabe
  JOIN EstabelecimentosRecalculoCreditoInssESocial ercie ON cabe.CabecalhoRecalculoCreditoInssESocialId = ercie.CabecalhoRecalculoCreditoInssESocialId
  JOIN LotacoesRecalculoCreditoInssESocial lrcie ON ercie.EstabelecimentoRecalculoCreditoInssESocialId = lrcie.EstabelecimentoRecalculoCreditoInssESocialId
  JOIN RemuneracoesRecalculoCreditoInssESocial rem ON lrcie.LotacaoRecalculoCreditoInssESocialId = rem.LotacaoRecalculoCreditoInssESocialId
  JOIN BasesCalculoTrabalhadorRecalculoCreditoInssESocial bases ON rem.RemuneracaoRecalculoCreditoInssESocialId = bases.RemuneracaoRecalculoCreditoInssESocialId
  LEFT JOIN DefCategoriaTrabalhadorESocial cat ON rem.CategoriaTrabalhadorESocialId = cat.CategoriaTrabalhadorESocialId
  LEFT JOIN DefTipoValorApuracaoESocial dtvae ON bases.TipoValorApuracaoESocialId = dtvae.TipoValorApuracaoESocialId
  LEFT JOIN DefIndicativo13SalarioESocialS5001 dises ON bases.Indicativo13SalarioESocialS5001Id = dises.Indicativo13SalarioESocialS5001Id
  LEFT JOIN DefCodigoIncidenciaTribRubricaPrevSocialESocial dcitrpse ON bases.CodigoIncidenciaTribRubricaPrevSocialESocialId = dcitrpse.CodigoIncidenciaTribRubricaPrevSocialESocialId
  
  --WHERE cabe.EmpresaId = '346f0e40-39c4-4fc9-8330-a707074d8b62' --	24449225000198	UNIMED CARUARU COOPERATIVA DE TRABALHO MEDICO
  WHERE cabe.EmpresaId = '19e3ae60-c70c-4355-b4a6-5eaafc88e995' -- AUDITORTESTE 	24449225000198	UNIMED CARUARU COOPERATIVA DE TRABALHO MEDICO
  AND rem.PeriodoApuracao >= '2019-08-01' AND rem.PeriodoApuracao < '2019-09-01' 
   
--  AND cat.Codigo = '101'
AND bases.TipoValorApuracaoESocialId = 8
  --AND bases.TipoValorApuracaoESocialId != 10
  --AND bases.ValorBaseCalculo < 0
  --AND rem.Cpf = '07313034407'
  AND rem.FinanciamentoAposentadoriaEspecialTempoContribESocialId = 4



  ORDER BY rem.Cpf,bases.TipoValorApuracaoESocialId
  
 