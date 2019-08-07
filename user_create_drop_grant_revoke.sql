CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
-- CREATE USER 'admin'@'%' IDENTIFIED BY 'admin'; -- LIBERA ACESSO PARA QUALQUER IP
-- CREATE USER 'usuario_nome'@'local_de_acesso(IP que ele ta tentando acessar)' IDENTIFIED BY 'senha';

GRANT ALL ON curso_sql.* TO 'admin'@'localhost';
-- GRANT nivel_de_acesso ON tabela.* TO 'usuario'@'ip_que_tera_acesso' 
CREATE USER 'admin'@'%' IDENTIFIED BY 'admin_viagem';
GRANT SELECT ON curso_sql.* TO 'admin'@'%';
-- GRANT INSERT ON curso_sql.* TO 'admin'@'%';
GRANT INSERT ON curso_sql.funcionarios TO 'admin'@'%';

REVOKE INSERT ON curso_sql.funcionarios FROM 'admin'@'%';
REVOKE SELECT ON curso_sql.* FROM 'admin'@'%'; -- Ou tira o acesso de todas ou não tira (quando é dado acesso para todos)

REVOKE ALL ON curso_sql.* FROM 'admin'@'localhost';

DROP USER 'admin'@'%';
DROP USER 'admin'@'localhost';

-- Listar usuários
SELECT User FROM mysql.user;

-- Privilegios dos usuarios
SHOW GRANTS FOR 'admin'@'%';
SHOW GRANTS FOR 'admin'@'localhost';