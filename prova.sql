CREATE schema PROVA;

use PROVA;

CREATE table Funcionarios(
	id_funcionario int,
    nome_funcionario varchar(25),
    cargo varchar(20),
    salario int,
    PRIMARY KEY (id_funcionario)
);

CREATE table Funcionarios_Projetos(
	id_projeto int,
    id_funcionario int,
    data_inicio date,
    data_fim date,
    FOREIGN KEY (id_funcionario) references Funcionarios(id_funcionario)
);

DROP TABLE Funcionarios_Projetos;
DROP TABLE Funcionarios;

INSERT INTO Funcionarios VALUES
(1, "João Silva", "Desenvolvedor", 5500)
;

INSERT INTO Funcionarios VALUES
(2, "Maria Oliveira", "Analista de Sistemas", 6000),
(3, "Carlos Pereira", "Gerente de Projetos", 7500),
(4, "Ana Costa", "Designer", 4800),
(5, "Lucas Almeida", "Consultor de TI", 6700)
;

INSERT INTO Funcionarios_Projetos VALUES
(1, 1, "2024-01-10", "2024-06-30"),
(2, 2, "2024-02-01", "2024-07-31"),
(3, 3, "2024-03-15", "2024-09-15"),
(4, 4, "2024-04-20", "2024-10-20"),
(5, 5, "2024-05-01", "2024-11-30");


-- 1

SELECT nome_funcionario, data_inicio, data_fim
FROM Funcionarios
JOIN Funcionarios_Projetos
ON Funcionarios.id_funcionario = Funcionarios_Projetos.id_funcionario
;

-- 2

SELECT nome_funcionario
FROM Funcionarios
JOIN Funcionarios_Projetos
ON Funcionarios.id_funcionario = Funcionarios_Projetos.id_funcionario
WHERE (data_inicio > "2024-03-01")
;

-- 3

SELECT nome_funcionario, cargo, data_fim
FROM Funcionarios
JOIN Funcionarios_Projetos
ON Funcionarios.id_funcionario = Funcionarios_Projetos.id_funcionario
;

-- 4

SELECT nome_funcionario, salario, data_inicio
FROM Funcionarios
JOIN Funcionarios_Projetos
ON Funcionarios.id_funcionario = Funcionarios_Projetos.id_funcionario
WHERE (salario>6000)
;

-- 5

SELECT nome_funcionario, cargo
FROM Funcionarios
JOIN Funcionarios_Projetos
ON Funcionarios.id_funcionario = Funcionarios_Projetos.id_funcionario
WHERE (data_fim < "2024-10-01")
;