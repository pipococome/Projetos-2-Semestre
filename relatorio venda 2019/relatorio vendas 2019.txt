SELECT a.id, a.datemissao, b.nome
FROM venda a, cliente b
WHERE a.idcliente = b.id
AND YEAR(a.datemissao) = 2019