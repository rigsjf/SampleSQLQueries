--USE WIIZIAUDITORDB_AUDITORTESTE
  SELECT * FROM ESocialEventosS1070 s1070
    JOIN ESocialInformacoesSuspensaoEventosS1070 eises ON s1070.ESocialEventoS1070Id = eises.ESocialEventoS1070Id
    WHERE s1070.NumeroProcesso = '00081697720104058300'
    ORDER BY s1070.InicioValidade

  SELECT DISTINCT s1010.EmpresaId--pro.* --NumeroProcessoContribuicaoPrevidenciaria,pro.CodigoIndicativoSuspensaoContribuicaoPrevidenciaria, s1010.CodigoRubrica , vig.ESocialVigenciaEventoS1010Id, vig.DataProcessamento,pro.ESocialProcessoContribuicaoPrevidenciariaEventoS1010Id
    FROM ESocialEventosS1010 s1010
    --JOIN ESocialVigenciasEventoS1010 vig ON s1010.ESocialEventoS1010Id = vig.ESocialEventoS1010Id
    JOIN ESocialProcessosContribuicaoPrevidenciariaEventoS1010 pro ON s1010.ESocialEventoS1010Id = pro.ESocialEventoS1010Id 
    --WHERE s1010.CodigoRubrica = '0017'
    --AND vig.ESocialVigenciaEventoS1010Id = '92b09ebe-b3c8-49fd-87fa-09d9883f90bf'
      WHERE pro.ESocialProcessoContribuicaoPrevidenciariaEventoS1010Id IS NOT NULL
    

  