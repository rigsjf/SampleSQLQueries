SELECT def.Descricao AS 'Tipo Operação'  ,s02.Codigo, FORMAT (c100.DataEntradaSaida, 'd', 'br' ) AS 'Data Entrada',
  (SELECT Codigo FROM DefCstCsosnIcmsXml dccix WHERE dccix.CstCsosnIcmsXmlId = icms.CstCsosnIcmsXmlId) AS 'CST Item XML'
  ,c170.CstIcms AS 'CST SPED',   item.Cfop AS 'CFOP Item XML',   c170.Cfop AS 'CFOP SPED', item.QuantidadeTributavel, icms.ValorBaseCalculoIcmsSt
  
  FROM SpedFiscalRegistros0000 sfr
  INNER JOIN SpedFiscalRegistrosC100 c100 ON sfr.SpedFiscalRegistro0000Id = c100.SpedFiscalRegistro0000Id
  INNER JOIN SpedFiscalRegistrosC170 c170 ON c100.SpedFiscalRegistroC100Id = c170.SpedFiscalRegistroC100Id
  INNER JOIN SpedFiscalRegistros0200 s02 ON c170.SpedFiscalRegistro0200Id = s02.SpedFiscalRegistro0200Id
  INNER JOIN AssociacoesSpedFiscalXmlEntradaIndividual assoc ON c170.SpedFiscalRegistroC170Id = assoc.SpedFiscalRegistroC170Id
  INNER JOIN NotaFiscalItensImportacoesXml item ON assoc.NotaFiscalItemImportacaoXmlId = item.NotaFiscalItemImportacaoXmlId
  INNER JOIN NotaFiscalItensTributacaoIcmsImportacoesXml icms ON item.NotaFiscalItemImportacaoXmlId = icms.NotaFiscalItemTributacaoIcmsImportacaoXmlId
  INNER JOIN DefTipoOperacaoNotaFiscal def ON c100.TipoOperacaoNotaFiscalId = def.TipoOperacaoNotaFiscalId
WHERE c100.TipoOperacaoNotaFiscalId = 1
  AND c170.CstIcms = '010'
  --AND c100.DataEntradaSaida > '2019-01-01' AND c100.DataEntradaSaida < '2021-01-01'
  AND sfr.Cnpj = '08824171000147'
  AND assoc.NotaFiscalItemImportacaoXmlId IS NOT NULL
  AND s02.Codigo IN ('10312',
'10313',
'10436',
'10437',
'11121',
'11761',
'13243',
'13244',
'13414',
'13415',
'13428',
'13429',
'13436',
'13437',
'13438',
'14423',
'15202',
'15515',
'15786',
'15889',
'16211',
'16212',
'16217',
'16476',
'16604',
'16605',
'16810',
'16811',
'17378',
'18092',
'18095',
'18110',
'18112',
'18113',
'18190',
'18288',
'18289',
'18290',
'18291',
'18292',
'18294',
'18296',
'18297',
'18654',
'18655',
'18659',
'18976',
'19501',
'20305',
'20306',
'20307',
'20308',
'20986',
'20987',
'20988',
'20995',
'20996',
'21571',
'21572',
'21609',
'21610',
'21624',
'21625',
'22008',
'22009',
'300',
'302',
'303',
'3118',
'3119',
'3136',
'3389',
'3723',
'378',
'447',
'4651',
'4752',
'5252',
'5323',
'5580',
'5613',
'5628',
'5633',
'5637',
'564',
'6027',
'6179',
'656',
'6635',
'6640',
'686',
'6930',
'7089',
'7128',
'7228',
'7242',
'7252',
'7334',
'7462',
'7480',
'7481',
'7603',
'7617',
'7618',
'7619',
'7676',
'7681',
'7862',
'7941',
'8056',
'8057',
'8063',
'8569',
'8779',
'8781',
'8785',
'8786',
'8913',
'9047',
'9049',
'9051',
'9150',
'9151',
'9259',
'9260',
'9353',
'9658'
)
  
ORDER BY s02.Codigo,c100.DataEntradaSaida



  