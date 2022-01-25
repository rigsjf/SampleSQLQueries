USE WIIZIAUDITORDB_AUDITORTESTE


SELECT eises.*
  FROM ESocialEventosS1070 ees
  JOIN ESocialInformacoesSuspensaoEventosS1070 eises ON ees.ESocialEventoS1070Id = eises.ESocialEventoS1070Id
  
  
--  WHERE cabe.EmpresaId = 'd2c998fa-b5ad-4fd1-96f7-d5eb939157d5' --	33331919000117	POSTO DE GASOLINA SUL AMERICA LTDA
--WHERE cabe.EmpresaId = '8f116d2a-9c7f-46ea-b9b6-f483aaa20ec5' --	05234289000127	BEST VIGILANCIA E SEGURANCA LTDA
WHERE ees.EmpresaId = '19e3ae60-c70c-4355-b4a6-5eaafc88e995' -- CARUARU