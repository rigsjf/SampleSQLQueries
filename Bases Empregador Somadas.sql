SELECT cat.Codigo AS 'Categoria',bases.TipoValorApuracaoESocialId AS 'Id Base',dtvae.Codigo + ' - ' + dtvae.DescricaoAbreviada AS 'Tipo Base',  dises.Descricao AS 'Ind 13 Sal',
  SUM(bases.ValorBaseCalculo) AS 'ValorBaseCalculo'
  FROM CabecalhosRecalculoCreditoInssESocial cabe
  JOIN RemuneracoesRecalculoCreditoInssESocial rem ON cabe.CabecalhoRecalculoCreditoInssESocialId = rem.CabecalhoRecalculoCreditoInssESocialId
  JOIN BasesCalculoTrabalhadorRecalculoCreditoInssESocial bases ON rem.RemuneracaoRecalculoCreditoInssESocialId = bases.RemuneracaoRecalculoCreditoInssESocialId
  JOIN DefCategoriaTrabalhadorESocial cat ON rem.CategoriaTrabalhadorESocialId = cat.CategoriaTrabalhadorESocialId
  JOIN DefTipoValorApuracaoESocial dtvae ON bases.TipoValorApuracaoESocialId = dtvae.TipoValorApuracaoESocialId
  JOIN DefIndicativo13SalarioESocialS5001 dises ON bases.Indicativo13SalarioESocialS5001Id = dises.Indicativo13SalarioESocialS5001Id
  JOIN DefCodigoIncidenciaTribRubricaPrevSocialESocial dcitrpse ON bases.CodigoIncidenciaTribRubricaPrevSocialESocialId = dcitrpse.CodigoIncidenciaTribRubricaPrevSocialESocialId
  
--  WHERE cabe.EmpresaId = 'd2c998fa-b5ad-4fd1-96f7-d5eb939157d5' --	33331919000117	POSTO DE GASOLINA SUL AMERICA LTDA
--WHERE cabe.EmpresaId = '8f116d2a-9c7f-46ea-b9b6-f483aaa20ec5' --	05234289000127	BEST VIGILANCIA E SEGURANCA LTDA
WHERE cabe.EmpresaId = '19e3ae60-c70c-4355-b4a6-5eaafc88e995' -- CARUARU
  --WHERE cabe.EmpresaId = 'b2e77dfa-8d71-4fdf-ab75-6ee434f01070' --KRAFT	24014235000109	UNIMED SETE LAGOAS COOPERATIVA DE TRABALHO MEDICO	UNIMED DE SETE LAGOAS - COOPERATIVA TRABALHO MEDICO	MATRIZ
--  WHERE cabe.EmpresaId = 'fdc00d04-1dec-43f5-8acf-3e5ff13c5200' -- KRAFT	26189530000113	UNIMED CURVELO COOPERATIVA DE TRABALHO MEDICO LTDA
  AND rem.PeriodoApuracao >= '2019-12-01' AND rem.PeriodoApuracao < '2020-01-01'
--  AND rem.Cpf IN ('01033472409','04324823421','05077882495','05320901445','06394770469','06423742448','07012680423','07253452410','07313034407','07437085470',
--'07705327481','07967670418','08158026419','08173732418','08822444426','09169620407','09453915440','10049994450','10899032435','11197963774')
--  AND rem.Cpf = '07228632419'
 --AND cat.Codigo = '101'
  --AND bases.TipoValorApuracaoESocialId NOT IN (1,2,3,4,5,6,7,8,9,10, 11, 12)
  AND bases.TipoValorApuracaoESocialId != 10
  
 GROUP BY 
  
  cat.Codigo,bases.TipoValorApuracaoESocialId,dtvae.Codigo,dtvae.DescricaoAbreviada,  dises.Descricao
 
 