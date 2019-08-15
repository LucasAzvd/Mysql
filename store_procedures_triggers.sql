USE curso_sql;

CREATE TABLE pedidos
(
	id int unsigned not null auto_increment,
    descricao varchar(100) not null,
    valor double not null default '0',
    pago varchar(3) not null default 'Não',
    PRIMARY KEY (id)
);
CREATE TABLE estoque 
(
	id int unsigned not null auto_increment,
    descricao varchar(50) not null,
    quantidade int not null,
    PRIMARY KEY (id)
);

INSERT INTO pedidos (descricao, valor) VALUES ('TV', 3000);
INSERT INTO pedidos (descricao, valor) VALUES ('GELADEIRA', 1400);
INSERT INTO pedidos (descricao, valor) VALUES ('DBD PLAYER', 300);
UPDATE pedidos SET pago = 'Sim' WHERE id = 8;
  
INSERT INTO estoque(descricao, quantidade) VALUES ('Fogão', 5);
INSERT INTO estoque(descricao, quantidade) VALUES ('Forno', 3);
  
-- STORE PROCEDURES
-- Vai em store procedures e pede pra criar 
USE `curso_sql`;
DROP procedure IF EXISTS `limpa_pedidos`;

DELIMITER $$
USE `curso_sql`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `limpa_pedidos`()
BEGIN
	SET SQL_SAFE_UPDATES = 0;
	DELETE FROM pedidos WHERE pago = 'Não';
END$$

DELIMITER ;
/* COMANDO QUE A GEROU
CREATE DEFINER=`root`@`localhost` PROCEDURE `limpa_pedidos`()
BEGIN
	SET SQL_SAFE_UPDATES = 0;
	DELETE FROM pedidos WHERE pago = 'Não';
END
*/
CALL limpa_pedidos();

-- TRIGGERS
CREATE TRIGGER gatilho_limpa_pedidos
BEFORE INSERT 
ON estoque
FOR EACH ROW -- Antes disso algo ocorra
CALL limpa_pedidos()











