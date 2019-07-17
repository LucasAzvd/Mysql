USE curso_sql;

CREATE TABLE funcionarios 
(
	id int unsigned not null auto_increment,
    nome varchar(45) not null,
    salario double not null default '0',
    departamento varchar(45) not null,
    PRIMARY KEY (id)
);





CREATE TABLE veiculos
(
	id int unsigned not null auto_increment,
    funcionario_id int unsigned not null,
    veiculo varchar(45) not null default '',
    placa varchar(10) not null default '',	
    PRIMARY KEY (id),
    CONSTRAINT fk_veiculos_funcionarios FOREIGN KEY (funcionario_idveiculos) REFERENCES funcionarios(id)
);


CREATE TABLE salarios
(
	faixa varchar(45) not null,
    inicio double not null,
    fim double not null,
    PRIMARY KEY (faixa)
);

ALTER TABLE funcionarios CHANGE COLUMN nome nome_func varchar(45) not null;
ALTER TABLE funcionarios CHANGE COLUMN nome_func nome varchar(45) not null;
ALTER TABLE funcionarios ADD DATA_NASCIMENTO VARCHAR(10);
ALTER TABLE funcionarios CHANGE DATA_NASCIMENTO NASCIMENTO DATE NULL;
ALTER TABLE funcionarios DROP NASCIMENTO;

DROP TABLE salarios;

CREATE INDEX departamentos ON funcionarios (departamento);
CREATE INDEX nomes ON funcionarios (nome(6)); 

