SELECT SUM(i.quantidade*i.precounitario), MONTH (v.datemissao)
FROM venda v, itemvenda i
WHERE i.idvenda = v.id
AND YEAR(v.datemissao) = 2019
GROUP BY MONTH (v.datemissao)
