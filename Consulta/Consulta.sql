SELECT a.id, a.descricao, 
      (SELECT COUNT(*) 
      FROM venda b 
      WHERE b.idformapagto = a.id) AS qtdevendas
FROM formapagto a;




SELECT a.id, SUM(a.quantidade * a.precounitario) AS totalsoma
FROM (SELECT b.id, b.datemissao, c.quantidade, c.precounitario
      FROM venda b, itemvenda c
      WHERE b.id = c.idvenda) a
GROUP BY 1



delimiter $$
CREATE OR REPLACE FUNCTION func_revisao(a INT, b INT)
       RETURNS FLOAT 
BEGIN 
   DECLARE num1 INT;
	DECLARE num2 INT;
	DECLARE total FLOAT;
	
	
	SET num1 = a;
	SET num2 = b;
	
	SET total = num1 + num2;
	    
   RETURN total;
END$$
delimiter;


SELECT func_revisao(10,20)

UPDATE itemvenda