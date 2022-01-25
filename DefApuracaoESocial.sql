USE WIIZIAUDITORDB_AUDITORTESTE
SELECT 
  dae.ApuracaoESocialId AS 'Ordem', dcitrpse.CodigoIncidenciaTribRubricaPrevSocialESocialId AS 'ID Incidência', dcitrpse.Codigo + ' - ' + dcitrpse.Descricao AS 'Incidência',
  dfaetce.Codigo AS 'Fin Apos Esp', dtvae.Codigo + ' - ' + dtvae.DescricaoAbreviada AS 'Base original', dtvae1.Codigo + ' - ' + dtvae1.DescricaoAbreviada AS 'Base Suspensa',
  dae.InicioValidade,dae.FimValidade
  
  
  FROM DefApuracaoESocial dae
  LEFT JOIN DefCodigoIncidenciaTribRubricaPrevSocialESocial dcitrpse ON dae.CodigoIncidenciaTribRubricaPrevSocialESocialId = dcitrpse.CodigoIncidenciaTribRubricaPrevSocialESocialId
  LEFT JOIN DefFinanciamentoAposentadoriaEspecialTempoContribESocial dfaetce ON dae.FinanciamentoAposentadoriaEspecialTempoContribESocialId = dfaetce.FinanciamentoAposentadoriaEspecialTempoContribESocialId
  LEFT JOIN DefTipoValorApuracaoESocial dtvae ON dae.TipoValorApuracaoESocialId = dtvae.TipoValorApuracaoESocialId
  LEFT JOIN DefTipoValorApuracaoESocial dtvae1 ON dae.TipoValorSuspensoId = dtvae1.TipoValorApuracaoESocialId

  