--USE WIIZIAUDITORDB_KRAFT
USE WIIZIAUDITORDB_AUDITORTESTE
  SELECT ees.CodigoRubrica, dcitrpse.CodigoIncidenciaTribRubricaPrevSocialESocialId AS 'ID Rubrica',dcitrpse.Codigo, eves.NumeroRecibo,eves.InicioValidade,eves.FimValidade,eves.DataProcessamento

     FROM ESocialEventosS1010 ees
    JOIN ESocialVigenciasEventoS1010 eves ON ees.ESocialEventoS1010Id = eves.ESocialEventoS1010Id
    JOIN DefCodigoIncidenciaTribRubricaPrevSocialESocial dcitrpse ON eves.CodigoIncidenciaTribRubricaPrevSocialESocialId = dcitrpse.CodigoIncidenciaTribRubricaPrevSocialESocialId
--WHERE ees.EmpresaId = 'b2e77dfa-8d71-4fdf-ab75-6ee434f01070' --KRAFT	24014235000109	UNIMED SETE LAGOAS COOPERATIVA DE TRABALHO MEDICO	UNIMED DE SETE LAGOAS - COOPERATIVA TRABALHO MEDICO	MATRIZ
--    WHERE ees.EmpresaId = '346f0e40-39c4-4fc9-8330-a707074d8b62' -- KRAFT CARUARU
   WHERE ees.EmpresaId = 'fc5eadbd-3b28-46a7-bb9a-2fc8edf76cf9' --- AUDITORTESTE GASMIG
    --AND dcitrpse.Codigo IN ('91','92','93','94','95','96','97','98','99')
    AND ees.CodigoRubrica = 'SEUNIMEDSE00000000000000000706'
    --AND eves.DataProcessamento <= '2020-01-06'
    
ORDER BY eves.DataProcessamento
    