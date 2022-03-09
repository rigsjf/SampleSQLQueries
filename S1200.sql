USE WIIZIAUDITORDB_AUDITORTESTE
  SELECT s1200.Cpf,dcte.Codigo,item.CodigoRubrica, item.ValorRubrica,s1200.IndicativoPeriodoApuracaoESocialId,s1200.NumeroReciboRetificado, s1200.NumeroRecibo,s1200.DataProcessamento,
    estab.CodigoLotacaoEstabelecimento,estab.NumeroInscricaoEstabelecimento,dem.IdentificadorDemonstrativosValoresDevidos
     FROM ESocialEventosS1200 s1200
    JOIN ESocialDemonstrativosValoresDevidosS1200 dem ON s1200.ESocialEventoS1200Id = dem.ESocialEventoS1200Id
    JOIN ESocialEstabelecimentosLotacoesS1200 estab ON dem.ESocialDemonstrativoValoresDevidosS1200Id = estab.ESocialDemonstrativoValoresDevidosS1200Id
    JOIN ESocialRemuneracoesPeriodoS1200 per ON estab.ESocialEstabelecimentoLotacoesS1200Id = per.ESocialEstabelecimentoLotacoesS1200Id
    JOIN ESocialItensRemuneracaoS1200 item ON per.ESocialRemuneracaoPeriodoS1200Id = item.ESocialRemuneracaoPeriodoS1200Id
    JOIN DefCategoriaTrabalhadorESocial dcte ON dem.CategoriaTrabalhadorESocialId = dcte.CategoriaTrabalhadorESocialId
      
    WHERE s1200.EmpresaId = '29e2b142-7e35-41ea-b31d-03232bcdd07c' -- AUDITORTESTE	06350074000134	RDJ ASSESSORIA E GESTAO EMPRESARIAL EIRELI
    --AND item.CodigoRubrica = '2301D'
    AND s1200.PeriodoApuracao >= '2019-04-01' AND s1200.PeriodoApuracao < '2019-05-01'
    AND dcte.Codigo = '111'
    --AND per.FinanciamentoAposentadoriaEspecialTempoContribESocialId = 4
    --AND s1200.NumeroRecibo = '1.1.0000000005618651394'
    --AND s1200.IdentificacaoEventoESocialId = 1
    --AND s1200.Cpf = '12663677647'
ORDER BY s1200.NumeroRecibo,cpf,item.CodigoRubrica
    
