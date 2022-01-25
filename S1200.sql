--USE WIIZIAUDITORDB_AUDITORTESTE
  SELECT s1200.Cpf,item.CodigoRubrica, item.ValorRubrica
     FROM ESocialEventosS1200 s1200
    JOIN ESocialDemonstrativosValoresDevidosS1200 dem ON s1200.ESocialEventoS1200Id = dem.ESocialEventoS1200Id
    JOIN ESocialEstabelecimentosLotacoesS1200 estab ON dem.ESocialDemonstrativoValoresDevidosS1200Id = estab.ESocialDemonstrativoValoresDevidosS1200Id
    JOIN ESocialRemuneracoesPeriodoS1200 per ON estab.ESocialEstabelecimentoLotacoesS1200Id = per.ESocialEstabelecimentoLotacoesS1200Id
    JOIN ESocialItensRemuneracaoS1200 item ON per.ESocialRemuneracaoPeriodoS1200Id = item.ESocialRemuneracaoPeriodoS1200Id
    JOIN DefCategoriaTrabalhadorESocial dcte ON dem.CategoriaTrabalhadorESocialId = dcte.CategoriaTrabalhadorESocialId
        WHERE s1200.EmpresaId = '19e3ae60-c70c-4355-b4a6-5eaafc88e995' -- CARUARU
    --WHERE s1200.EmpresaId = '13736d00-c279-40dc-a517-3d4382a64729' -- REI DO ARROZ
    --AND item.CodigoRubrica = '2301D'
    AND s1200.PeriodoApuracao >= '2019-08-01' AND s1200.PeriodoApuracao < '2019-09-01'
    AND dcte.Codigo = '101'
    AND per.FinanciamentoAposentadoriaEspecialTempoContribESocialId = 4
    --AND s1200.IdentificacaoEventoESocialId = 1
    --AND s1200.Cpf = '09698010416'
ORDER BY cpf,item.CodigoRubrica
    
