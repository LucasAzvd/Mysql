USE curso_sql;

SELECT COUNT(*) FROM funcionarios WHERE salario > 1600;
SELECT COUNT(*) FROM funcionarios WHERE salario > 1600 AND departamento = 'Juridico';

SELECT SUM(salario) FROM funcionarios WHERE departamento = 'TI';

SELECT AVG(salario) FROM funcionarios WHERE departamento = 'TI';

SELECT MAX(salario) FROM funcionarios WHERE departamento = 'TI';
SELECT nome, MIN(salario) FROM funcionarios WHERE departamento = 'TI';

-- UNICOS
SELECT DISTINCT (departamento) FROM funcionarios;

SELECT * FROM funcionarios ORDER BY nome ASC;
SELECT * FROM funcionarios ORDER BY nome DESC;
SELECT * FROM funcionarios ORDER BY departamento DESC, salario;

SELECT * FROM funcionarios LIMIT 2;

-- EXPRESSÕES IGUAIS
SELECT * FROM funcionarios LIMIT 2 OFFSET 1;
-- PRIMEIRO É PASSADO O QUE SE QUER PULAR
SELECT * FROM funcionarios LIMIT 1, 2;

SELECT departamento, AVG(salario) FROM funcionarios GROUP BY departamento;

-- HAVING SEMELHANTE A WHERE
SELECT departamento, AVG(salario) FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 2000;
SELECT departamento, COUNT(*) FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 2000;

SELECT nome FROM funcionarios WHERE departamento IN (
SELECT departamento FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 2000);

SELECT nome FROM funcionarios WHERE departamento IN (
	SELECT departamento FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 2000
);



