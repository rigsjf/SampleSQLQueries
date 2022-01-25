SELECT DISTINCT nfiix.CodigoProduto, nfiix.QuantidadeTributavel, nfiix.ValorTotalProdutos, nfiix.ValorDesconto, nfix.DataEmissao

  FROM NotaFiscalItensImportacoesXml nfiix
  INNER JOIN NotasFiscaisImportacoesXml nfix ON nfix.NotaFiscalImportacaoXmlId = nfiix.NotaFiscalImportacaoXmlId
  INNER JOIN NotaFiscalItensTributacaoIcmsImportacoesXml nfitiix ON nfiix.NotaFiscalItemImportacaoXmlId = nfitiix.NotaFiscalItemTributacaoIcmsImportacaoXmlId
  INNER JOIN EmitentesImportacoesXml eix ON nfix.EmitenteImportacaoXmlId = eix.EmitenteImportacaoXmlId
  INNER JOIN Empresas e ON nfix.EmpresaId = e.EmpresaId

WHERE nfitiix.CstCsosnIcmsXmlId = 9
  AND eix.Cnpj = e.Cnpj
  AND nfix.DataEmissao > '2016-12-31'
  AND nfix.DataEmissao <= '2017-12-31'
  AND e.Apelido = 'FILIAL 4'
  AND nfiix.CodigoProduto IN ('124',
'125',
'126',
'2584',
'2592',
'2593',
'2598',
'2599',
'268',
'270',
'274',
'2874',
'4862',
'5083',
'5568',
'86',
'92',
'94',
'96')

  ORDER BY nfiix.CodigoProduto
  
  