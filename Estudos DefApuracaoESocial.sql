--USE WIIZIAUDITORDB_AUDITORTESTE
SELECT 
  
  dae.ApuracaoESocialId,dae.CodigoIncidenciaTribRubricaPrevSocialESocialId AS 'ID incid',incid.Codigo AS 'Cod Incidência',incid.Descricao AS 'Incidência' , fin.Codigo AS 'Fin Apos Esp' ,dae.TipoValorApuracaoESocialId AS 'ID Base' ,tipo.Codigo AS 'Tipo Base', tipo.DescricaoAbreviada, dae.InicioValidade, dae.FimValidade
  
  FROM DefApuracaoESocial dae
  JOIN DefCodigoIncidenciaTribRubricaPrevSocialESocial incid ON dae.CodigoIncidenciaTribRubricaPrevSocialESocialId = incid.CodigoIncidenciaTribRubricaPrevSocialESocialId
  JOIN DefTipoValorApuracaoESocial tipo ON dae.TipoValorApuracaoESocialId = tipo.TipoValorApuracaoESocialId
  LEFT JOIN DefFinanciamentoAposentadoriaEspecialTempoContribESocial fin ON dae.FinanciamentoAposentadoriaEspecialTempoContribESocialId = fin.FinanciamentoAposentadoriaEspecialTempoContribESocialId