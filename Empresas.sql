USE WIIZIAUDITORDB_KRAFT

SELECT e.EmpresaId,e.Cnpj,e.RazaoSocial,e.NomeFantasia,e.Apelido
  FROM Empresas e 
 --WHERE e.RazaoSocial LIKE '%CEREAIS%'
--  WHERE e.Cnpj LIKE '%06350074%'
  WHERE e.Cnpj = '01867792000169'
  --WHERE empresaid = '616736cf-d693-400a-96e7-cec2b6df8cdf'
  ORDER BY e.RazaoSocial
 

 