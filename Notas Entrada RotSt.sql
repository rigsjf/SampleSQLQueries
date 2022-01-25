SELECT DISTINCT s200.Codigo, itens.QuantidadeTributavel,c100.DataEntradaSaida AS 'Data Saída'
  FROM NotaFiscalItensImportacoesXml itens

INNER JOIN NotaFiscalItensTributacaoIcmsImportacoesXml icms ON icms.NotaFiscalItemTributacaoIcmsImportacaoXmlId = itens.NotaFiscalItemImportacaoXmlId
INNER JOIN AssociacoesSpedFiscalXmlEntradaIndividual assoc ON assoc.NotaFiscalItemImportacaoXmlId = itens.NotaFiscalItemImportacaoXmlId
INNER JOIN SpedFiscalRegistrosC170 c170 ON c170.SpedFiscalRegistroC170Id = assoc.SpedFiscalRegistroC170Id
INNER JOIN SpedFiscalRegistros0200 s200 ON c170.SpedFiscalRegistro0200Id = s200.SpedFiscalRegistro0200Id
INNER JOIN SpedFiscalRegistrosC100 c100 ON c100.SpedFiscalRegistroC100Id = c170.SpedFiscalRegistroC100Id
INNER JOIN SpedFiscalRegistros0000 sfr ON sfr.SpedFiscalRegistro0000Id = c100.SpedFiscalRegistro0000Id
INNER JOIN NotasFiscaisImportacoesXml nfix ON itens.NotaFiscalImportacaoXmlId = nfix.NotaFiscalImportacaoXmlId

WHERE sfr.EmpresaId = '5a375172-0ff1-4cc0-8822-30dcddc85500'

  AND nfix.EmpresaId = '5a375172-0ff1-4cc0-8822-30dcddc85500'
  AND c100.TipoOperacaoNotaFiscalId = 1
  AND c100.DataEntradaSaida <= '2016-12-31'
  --AND icms.CstCsosnIcmsXmlId IN (2, 4, 10)
  AND s200.Codigo IN ('124','125','126','2584','2592','2593','2598','2599','268','270','274','2874','4862','5083','5568','86','92','94','96')
  ORDER BY s200.Codigo,c100.DataEntradaSaida
