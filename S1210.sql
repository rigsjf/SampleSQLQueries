﻿--USE WIIZIAUDITORDB_FISCOPLAN
  SELECT * FROM ESocialEventosS1210 ees

    WHERE ees.EmpresaId = '8f116d2a-9c7f-46ea-b9b6-f483aaa20ec5' --	05234289000127	BEST VIGILANCIA E SEGURANCA LTDA
    AND ees.PeriodoApuracao >= '2021-11-01' AND ees.PeriodoApuracao < '2021-12-01'