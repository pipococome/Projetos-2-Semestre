delimiter $$
CREATE OR REPLACE function f_mediaCompras(idcli INT) 
   RETURNS FLOAT 
BEGIN
  DECLARE media FLOAT;
  
  SELECT SUM(b.quantidade * b.precounitario) /
     (SELECT COUNT(*) FROM venda c 
       WHERE c.idcliente = a.idcliente) 
  FROM venda a, itemvenda b
  WHERE b.idvenda = a.id
  AND a.idcliente = idcli
  INTO media;

 

  if (media is NULL) then
    SET media = 0;
  END if;
    
  RETURN media; 
END $$
delimiter ;

SELECT f_mediaCompras(1)