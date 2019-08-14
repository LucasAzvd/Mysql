USE curso_sql;

-- Verifica as Engines, quais suportam o transactions
-- Fomatos com transactions, permite transações
SHOW ENGINES;

CREATE TABLE contas_bancarias
(
	id int unsigned not null auto_increment,
    titular varchar(45) not null,
    saldo double not null,
    PRIMARY KEY (id)
) engine = InnoDB;

INSERT INTO contas_bancarias(titular, saldo) VALUES ('André', 1000);
INSERT INTO contas_bancarias(titular, saldo) VALUES ('Carlos', 2000);

start transaction;
UPDATE contas_bancarias SET saldo = saldo - 100 WHERE id = 1;
UPDATE contas_bancarias SET saldo = saldo + 100 WHERE id = 2;
rollback; -- bloqueia a atualização para os outros usuários (desfaz)

start transaction;
UPDATE contas_bancarias SET saldo = saldo - 100 WHERE id = 1;
UPDATE contas_bancarias SET saldo = saldo + 100 WHERE id = 2;
commit; -- libera a alteração para os outros usuários