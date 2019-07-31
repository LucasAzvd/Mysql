USE curso_sql;

SELECT * FROM funcionarios;
SELECT * FROM veiculos;
SELECT * FROM salarios;

SELECT * FROM funcionarios as f INNER JOIN veiculos as v ON v.funcionario_id = f.id;
SELECT * FROM funcionarios as f LEFT JOIN veiculos as v ON v.funcionario_id = f.id;
SELECT * FROM funcionarios as f INNER JOIN veiculos as v ON v.funcionario_id = f.id;

-- SELECT * FROM funcionarios as f FULL OUTER JOIN veiculos as v ON v.funcionario_id = f.id;
-- FULL JOIN
SELECT * FROM funcionarios as f LEFT JOIN veiculos as v ON v.funcionario_id = f.id
UNION
SELECT * FROM funcionarios as f INNER JOIN veiculos as v ON v.funcionario_id = f.id;

CREATE TABLE cpfs
(
	id int unsigned not null,
    cpf varchar(14) not null,
    PRIMARY KEY (id),
    CONSTRAINT fk_cpf FOREIGN KEY (id) REFERENCES funcionarios (id)
);

INSERT INTO cpfs (id, cpf) VALUES (1, '111.111.111-11');
INSERT INTO cpfs (id, cpf) VALUES (2, '211.111.111-11');
INSERT INTO cpfs (id, cpf) VALUES (3, '311.111.111-11');
INSERT INTO cpfs (id, cpf) VALUES (5, '411.111.111-11');

SELECT * FROM cpfs;

SELECT * FROM funcionarios INNER JOIN cpfs ON funcionarios.id = cpfs.id;
SELECT * FROM funcionarios INNER JOIN cpfs USING(id);

CREATE TABLE clientes
(
	id int unsigned not null auto_increment,
    nome varchar(45) not null,
    quem_indicou int unsigned,
    PRIMARY KEY (id),
    CONSTRAINT fk_quem_indicou FOREIGN KEY (quem_indicou) REFERENCES clientes (id)
);

INSERT INTO clientes (id, nome, quem_indicou) VALUES (1,'André',NULL);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (2,'Samuel',1);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (3,'Carlos',2);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (4,'Rafael',1);

SELECT * FROM clientes;
-- Equi Join
SELECT a.nome, b.nome FROM clientes as a join clientes as b ON a.quem_indicou = b.id;

SELECT * FROM funcionarios as f 
INNER JOIN veiculos as v ON v.funcionario_id = f.id
INNER JOIN cpfs ON cpfs.id = f.id;

CREATE VIEW funcionarios_a AS SELECT * FROM funcionarios WHERE salario >= 1800;

SELECT * FROM funcionarios_a;
UPDATE funcionarios SET salario = 1500 WHERE id = 3;

DROP VIEW funcionarios_a;









