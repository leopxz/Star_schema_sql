CREATE DATABASE base_powerbi;
USE base_powerbi;


CREATE TABLE Professor (
    idProfessor INT PRIMARY KEY,
    Nome VARCHAR(100),
    Especialidade VARCHAR(100),
    DataContratacao DATE,
    Nivel VARCHAR(50)
);

CREATE TABLE Curso (
    idCurso INT PRIMARY KEY,
    NomeCurso VARCHAR(100),
    Duracao INT, 
    DataInicio DATE
);

CREATE TABLE Departamento (
    idDepartamento INT PRIMARY KEY,
    NomeDepartamento VARCHAR(100),
    Campus VARCHAR(100),
    Coordenador VARCHAR(100)
);

CREATE TABLE Disciplina (
    idDisciplina INT PRIMARY KEY,
    NomeDisciplina VARCHAR(100),
    CargaHoraria DECIMAL(5,2),
    PreRequisitos VARCHAR(100)
);

CREATE TABLE Dimensao_Data (
    idData INT PRIMARY KEY AUTO_INCREMENT,
    Dia INT,
    Mes INT,
    Ano INT,
    Trimestre INT,
    Semestre INT
);

CREATE TABLE Fact_Professor (
    idProfessor INT,
    idCurso INT,
    idDepartamento INT,
    idDisciplina INT,
    idDataOfertaDisciplina INT,
    HorasAula DECIMAL(5,2),
    Salario DECIMAL(10,2),
    PRIMARY KEY (idProfessor, idDisciplina, idCurso, idDataOfertaDisciplina),
    FOREIGN KEY (idProfessor) REFERENCES Professor(idProfessor),
    FOREIGN KEY (idCurso) REFERENCES Curso(idCurso),
    FOREIGN KEY (idDepartamento) REFERENCES Departamento(idDepartamento),
    FOREIGN KEY (idDisciplina) REFERENCES Disciplina(idDisciplina),
    FOREIGN KEY (idDataOfertaDisciplina) REFERENCES Dimensao_Data(idData)
);


INSERT INTO Professor (idProfessor, Nome, Especialidade, DataContratacao, Nivel) VALUES
(1, 'João Silva', 'Matemática', '2015-03-12', 'Adjunto'),
(2, 'Maria Oliveira', 'Física', '2017-06-23', 'Titular'),
(3, 'Carlos Souza', 'Química', '2014-09-10', 'Adjunto'),
(4, 'Ana Costa', 'Biologia', '2018-11-15', 'Titular'),
(5, 'Pedro Almeida', 'História', '2016-05-04', 'Adjunto'),
(6, 'Marcos Pereira', 'Geografia', '2013-01-30', 'Titular'),
(7, 'Juliana Santos', 'Matemática', '2020-07-18', 'Adjunto'),
(8, 'Roberto Lima', 'Física', '2019-08-25', 'Titular'),
(9, 'Fernanda Marques', 'Química', '2016-12-20', 'Adjunto'),
(10, 'Daniel Rocha', 'Biologia', '2014-02-05', 'Titular'),
(11, 'Paulo Ferreira', 'História', '2015-04-19', 'Adjunto'),
(12, 'Ricardo Gomes', 'Geografia', '2012-10-22', 'Titular'),
(13, 'Lucas Mendes', 'Matemática', '2017-09-08', 'Adjunto'),
(14, 'Vanessa Braga', 'Física', '2018-03-31', 'Titular'),
(15, 'Carla Xavier', 'Química', '2015-07-14', 'Adjunto'),
(16, 'Leonardo Azevedo', 'Biologia', '2019-12-09', 'Titular'),
(17, 'Sofia Batista', 'História', '2021-06-02', 'Adjunto'),
(18, 'Bruno Nunes', 'Geografia', '2020-09-19', 'Titular'),
(19, 'Patrícia Ribeiro', 'Matemática', '2016-03-27', 'Adjunto'),
(20, 'Rafael Duarte', 'Física', '2013-05-16', 'Titular');


INSERT INTO Curso (idCurso, NomeCurso, Duracao, DataInicio) VALUES
(1, 'Engenharia', 48, '2015-01-15'),
(2, 'Medicina', 72, '2014-02-10'),
(3, 'Direito', 60, '2016-03-20'),
(4, 'Arquitetura', 48, '2017-04-25'),
(5, 'Matemática', 48, '2018-05-14'),
(6, 'Física', 48, '2019-06-18'),
(7, 'Química', 48, '2015-07-22'),
(8, 'Biologia', 48, '2016-08-30'),
(9, 'História', 48, '2017-09-05'),
(10, 'Geografia', 48, '2018-10-11'),
(11, 'Engenharia Civil', 60, '2019-11-23'),
(12, 'Administração', 48, '2020-12-15'),
(13, 'Psicologia', 60, '2016-01-05'),
(14, 'Filosofia', 48, '2017-02-07'),
(15, 'Sociologia', 48, '2018-03-09'),
(16, 'Enfermagem', 48, '2019-04-11'),
(17, 'Farmácia', 48, '2020-05-13'),
(18, 'Economia', 48, '2021-06-15'),
(19, 'Design', 48, '2022-07-17'),
(20, 'Educação Física', 48, '2015-08-19');

INSERT INTO Departamento (idDepartamento, NomeDepartamento, Campus, Coordenador) VALUES
(1, 'Departamento de Exatas', 'Campus 1', 'João Silva'),
(2, 'Departamento de Saúde', 'Campus 2', 'Maria Oliveira'),
(3, 'Departamento de Humanas', 'Campus 3', 'Carlos Souza'),
(4, 'Departamento de Ciências Biológicas', 'Campus 4', 'Ana Costa'),
(5, 'Departamento de História e Geografia', 'Campus 5', 'Pedro Almeida'),
(6, 'Departamento de Engenharia', 'Campus 1', 'Marcos Pereira'),
(7, 'Departamento de Matemática', 'Campus 2', 'Juliana Santos'),
(8, 'Departamento de Física', 'Campus 3', 'Roberto Lima'),
(9, 'Departamento de Química', 'Campus 4', 'Fernanda Marques'),
(10, 'Departamento de Biologia', 'Campus 5', 'Daniel Rocha'),
(11, 'Departamento de História', 'Campus 1', 'Paulo Ferreira'),
(12, 'Departamento de Geografia', 'Campus 2', 'Ricardo Gomes'),
(13, 'Departamento de Engenharia Civil', 'Campus 3', 'Lucas Mendes'),
(14, 'Departamento de Administração', 'Campus 4', 'Vanessa Braga'),
(15, 'Departamento de Psicologia', 'Campus 5', 'Carla Xavier'),
(16, 'Departamento de Filosofia', 'Campus 1', 'Leonardo Azevedo'),
(17, 'Departamento de Sociologia', 'Campus 2', 'Sofia Batista'),
(18, 'Departamento de Enfermagem', 'Campus 3', 'Bruno Nunes'),
(19, 'Departamento de Farmácia', 'Campus 4', 'Patrícia Ribeiro'),
(20, 'Departamento de Educação Física', 'Campus 5', 'Rafael Duarte');

INSERT INTO Disciplina (idDisciplina, NomeDisciplina, CargaHoraria, PreRequisitos) VALUES
(1, 'Cálculo I', 60, 'Nenhum'),
(2, 'Física I', 60, 'Nenhum'),
(3, 'Química Geral', 60, 'Nenhum'),
(4, 'Biologia Celular', 60, 'Nenhum'),
(5, 'História Antiga', 60, 'Nenhum'),
(6, 'Geografia Física', 60, 'Nenhum'),
(7, 'Cálculo II', 60, 'Cálculo I'),
(8, 'Física II', 60, 'Física I'),
(9, 'Química Orgânica', 60, 'Química Geral'),
(10, 'Biologia Molecular', 60, 'Biologia Celular'),
(11, 'História Medieval', 60, 'História Antiga'),
(12, 'Geografia Humana', 60, 'Geografia Física'),
(13, 'Cálculo III', 60, 'Cálculo II'),
(14, 'Física III', 60, 'Física II'),
(15, 'Química Inorgânica', 60, 'Química Orgânica'),
(16, 'Ecologia', 60, 'Biologia Molecular'),
(17, 'História Contemporânea', 60, 'História Medieval'),
(18, 'Geopolítica', 60, 'Geografia Humana'),
(19, 'Álgebra Linear', 60, 'Cálculo III'),
(20, 'Mecânica', 60, 'Física III');

INSERT INTO Dimensao_Data (Dia, Mes, Ano, Trimestre, Semestre) VALUES
(1, 1, 2021, 1, 1),
(2, 2, 2021, 1, 1),
(3, 3, 2021, 1, 1),
(4, 4, 2021, 2, 1),
(5, 5, 2021, 2, 1),
(6, 6, 2021, 2, 1),
(7, 7, 2021, 3, 2),
(8, 8, 2021, 3, 2),
(9, 9, 2021, 3, 2),
(10, 10, 2021, 4, 2),
(11, 11, 2021, 4, 2),
(12, 12, 2021, 4, 2),
(13, 1, 2022, 1, 1),
(14, 2, 2022, 1, 1),
(15, 3, 2022, 1, 1),
(16, 4, 2022, 2, 1),
(17, 5, 2022, 2, 1),
(18, 6, 2022, 2, 1),
(19, 7, 2022, 3, 2),
(20, 8, 2022, 3, 2);

INSERT INTO Fact_Professor (idProfessor, idCurso, idDepartamento, idDisciplina, idDataOfertaDisciplina, HorasAula, Salario) VALUES
(1, 1, 1, 1, 1, 40, 5000),
(2, 2, 2, 2, 2, 45, 5500),
(3, 3, 3, 3, 3, 30, 4500),
(4, 4, 4, 4, 4, 35, 5200),
(5, 5, 5, 5, 5, 20, 3000),
(6, 6, 6, 6, 6, 50, 6000),
(7, 7, 7, 7, 7, 25, 4000),
(8, 8, 8, 8, 8, 55, 6500),
(9, 9, 9, 9, 9, 60, 7000),
(10, 10, 10, 10, 10, 40, 5000),
(11, 11, 11, 11, 11, 45, 5500),
(12, 12, 12, 12, 12, 30, 4500),
(13, 13, 13, 13, 13, 35, 5200),
(14, 14, 14, 14, 14, 20, 3000),
(15, 15, 15, 15, 15, 50, 6000),
(16, 16, 16, 16, 16, 25, 4000),
(17, 17, 17, 17, 17, 55, 6500),
(18, 18, 18, 18, 18, 60, 7000),
(19, 19, 19, 19, 19, 40, 5000),
(20, 20, 20, 20, 20, 45, 5500);