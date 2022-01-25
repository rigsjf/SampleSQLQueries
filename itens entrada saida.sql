SELECT DISTINCT s02.Codigo
  
  FROM SpedFiscalRegistros0000 sfr
  INNER JOIN SpedFiscalRegistrosC100 c100 ON sfr.SpedFiscalRegistro0000Id = c100.SpedFiscalRegistro0000Id
  INNER JOIN SpedFiscalRegistrosC170 c170 ON c100.SpedFiscalRegistroC100Id = c170.SpedFiscalRegistroC100Id
  INNER JOIN SpedFiscalRegistros0200 s02 ON c170.SpedFiscalRegistro0200Id = s02.SpedFiscalRegistro0200Id
  INNER JOIN AssociacoesSpedFiscalXmlEntradaIndividual assoc ON c170.SpedFiscalRegistroC170Id = assoc.SpedFiscalRegistroC170Id
  INNER JOIN NotaFiscalItensImportacoesXml item ON assoc.NotaFiscalItemImportacaoXmlId = item.NotaFiscalItemImportacaoXmlId
WHERE c100.TipoOperacaoNotaFiscalId = 1
  AND c170.CstIcms = '010'
  --AND c100.DataEntradaSaida > '2019-01-01' AND c100.DataEntradaSaida < '2021-01-01'
  AND sfr.Cnpj = '08824171000147'
  AND assoc.NotaFiscalItemImportacaoXmlId IS NOT NULL
  AND EXISTS (SELECT 
  item.CodigoProduto
  
  
  FROM NotasFiscaisImportacoesXml nfix
  INNER JOIN Empresas e ON nfix.EmpresaId = e.EmpresaId
  INNER JOIN NotaFiscalItensImportacoesXml item ON nfix.NotaFiscalImportacaoXmlId = item.NotaFiscalImportacaoXmlId
  INNER JOIN NotaFiscalItensTributacaoIcmsImportacoesXml icms ON item.NotaFiscalItemImportacaoXmlId = icms.NotaFiscalItemTributacaoIcmsImportacaoXmlId
  INNER JOIN DefCstCsosnIcmsXml cst ON icms.CstCsosnIcmsXmlId = cst.CstCsosnIcmsXmlId

  WHERE e.Cnpj = '08824171000147'
  AND item.CodigoProduto = s02.Codigo)

--ORDER BY c100.DataEntradaSaida



  