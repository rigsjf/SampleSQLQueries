SELECT DISTINCT CodigoProduto FROM ProdutosRecalculoRotSt prod  
INNER JOIN CorposEstoquesRecalculoRotSt estoque ON prod.ProdutoRecalculoRotStId = estoque.ProdutoRecalculoRotStId
  LEFT JOIN CorposRecalculoRotSt corpo ON estoque.CorpoEstoqueRecalculoRotStId = corpo.CorpoEstoqueRecalculoRotStId
  INNER JOIN CabecalhosRecalculoRotSt cabe ON estoque.CabecalhoRecalculoRotStId = cabe.CabecalhoRecalculoRotStId


 WHERE prod.CodigoProduto IN ( SELECT s200.Codigo FROM SpedFiscalRegistros0000 sped
    INNER JOIN SpedFiscalRegistrosH005 h05 ON h05.SpedFiscalRegistro0000Id = sped.SpedFiscalRegistro0000Id
    INNER JOIN SpedFiscalRegistrosH010 h10 ON h05.SpedFiscalRegistroH005Id = h10.SpedFiscalRegistroH005Id
    LEFT JOIN SpedFiscalRegistros0200 s200 ON h10.SpedFiscalRegistro0200Id = s200.SpedFiscalRegistro0200Id
    INNER JOIN Empresas e ON e.EmpresaId = sped.EmpresaId
    WHERE e.Apelido = 'MATRIZ'   AND h10.SpedFiscalRegistroH010Id IS NOT null)

  AND cabe.DataInicial >= '2021-01-01'

  ORDER BY prod.CodigoProduto

