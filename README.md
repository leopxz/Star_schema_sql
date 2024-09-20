# Star Schema - Análise da tabela Professor 

## Contexto
Este projeto tem como objetivo criar um modelo dimensional (Star Schema) baseado em um diagrama relacional para análise de dados dos professores de uma universidade. A ideia principal é permitir a análise de métricas relacionadas aos professores, como cursos ministrados, departamentos envolvidos, disciplinas oferecidas e dados temporais. O foco da modelagem está no professor como o objeto de análise, excluindo dados sobre os alunos.

A modelagem inclui uma tabela fato (Fact_Professor) e várias tabelas de dimensões, como professores, cursos, departamentos, disciplinas e datas. O modelo foi construído com base em um diagrama relacional existente e organizado de forma a facilitar a consulta e análise em ferramentas como Power BI ou outros sistemas de BI.

## Configuração
Requisitos
Para replicar o projeto, é necessário configurar um ambiente de banco de dados relacional (ex: MySQL, PostgreSQL ou SQL Server). Os seguintes passos são recomendados para configuração:

Instale o sistema de gerenciamento de banco de dados (SGBD) de sua escolha.
Configure um banco de dados para o projeto, por exemplo: base_powerbi.
Execute os scripts SQL fornecidos para criar as tabelas de dimensões e fato.
Popular o banco de dados utilizando os scripts de INSERT fornecidos para cada tabela.

## Execução
Após configurar o banco de dados, você pode usar ferramentas de BI como Power BI para se conectar ao banco de dados e criar relatórios baseados no modelo dimensional.

Passos para Visualizar os Dados no Power BI:
Abra o Power BI.
Selecione Obter Dados > Banco de Dados MySQL.
Insira as credenciais e o nome do banco de dados (base_powerbi).
Importe as tabelas de Fact_Professor, Professor, Curso, Departamento, Disciplina e Dimensao_Data.
Crie os relacionamentos conforme definido no modelo dimensional (os relacionamentos sugeridos serão baseados nas chaves primárias e estrangeiras).
Visualize e crie seus relatórios e dashboards com base nas tabelas importadas.

## Estrutura
A estrutura do projeto segue uma arquitetura de banco de dados dimensional com uma tabela fato central e várias tabelas de dimensões que fornecem contexto detalhado para a análise.

Tabelas
Fact_Professor: Tabela fato que armazena as métricas sobre o professor, incluindo o curso ministrado, departamento, disciplina e dados temporais. Campos principais:

idProfessor: Identificador do professor.
idCurso: Identificador do curso.
idDepartamento: Identificador do departamento.
idDisciplina: Identificador da disciplina.
idDataOfertaDisciplina: Referência à data da oferta da disciplina.
HorasAula: Quantidade de horas de aula lecionadas.
Salario: Salário correspondente às horas lecionadas.
Dim_Professor: Armazena os detalhes dos professores. Exemplo de campos:

idProfessor: Identificador único do professor.
NomeProfessor: Nome do professor.
Especialidade: Área de especialidade do professor.
DataContratacao: Data de contratação do professor.
Nivel: Nível do professor (ex: Júnior, Pleno, Sênior).
Dim_Curso: Detalha os cursos oferecidos. Campos principais:

idCurso: Identificador único do curso.
NomeCurso: Nome do curso.
Duracao: Duração em meses.
DataInicio: Data de início do curso.
Dim_Departamento: Informações sobre os departamentos da universidade. Campos principais:

idDepartamento: Identificador único do departamento.
NomeDepartamento: Nome do departamento.
Campus: Nome do campus ao qual o departamento pertence.
Coordenador: Nome do professor coordenador do departamento.
Dim_Disciplina: Detalhes das disciplinas oferecidas. Exemplo de campos:

idDisciplina: Identificador único da disciplina.
NomeDisciplina: Nome da disciplina.
CargaHoraria: Carga horária total da disciplina.
PreRequisitos: Pré-requisitos da disciplina (se houver).
Dim_Data: Tabela de dimensão temporal que armazena as datas de oferta das disciplinas. Exemplo de campos:

idData: Identificador da data.
Dia: O dia da oferta.
Mes: O mês da oferta.
Ano: O ano da oferta.
Trimestre: Trimestre correspondente.
Semestre: Semestre correspondente.

## Explicando as relações das tabelas

1. Dim_Professor
Essa tabela contém informações detalhadas sobre os professores, como o nome, especialidade, data de contratação e nível.

Relacionamento:
1 para N com Fact_Professor: Um professor pode ser associado a várias disciplinas ao longo do tempo, mas uma linha na Fact_Professor está relacionada a um único professor.
2. Dim_Curso
Contém informações sobre os cursos oferecidos pela instituição, como nome, duração e data de início.

Relacionamento:
1 para N com Fact_Professor: Um curso pode ter vários professores associados, mas uma linha na Fact_Professor corresponde a um único curso.
3. Dim_Departamento
Esta tabela armazena os dados sobre os departamentos, incluindo o nome, campus e o coordenador.

Relacionamento:
1 para N com Fact_Professor: Um departamento pode ter vários professores associados, mas um professor (via Fact_Professor) pertence a um único departamento em uma oferta de disciplina específica.
4. Dim_Disciplina
Essa tabela contém informações sobre as disciplinas, como o nome, carga horária e pré-requisitos.

Relacionamento:
1 para N com Fact_Professor: Uma disciplina pode ser ministrada por vários professores em diferentes momentos, mas uma entrada em Fact_Professor corresponde a uma disciplina específica.
5. Dimensao_Data
Esta tabela armazena a dimensão de data, útil para registrar quando uma disciplina foi oferecida. Inclui campos como o dia, mês, ano, trimestre e semestre.

Relacionamento:
1 para N com Fact_Professor: Uma data pode estar relacionada a várias ofertas de disciplinas (Fact_Professor), mas uma oferta específica de disciplina está associada a uma única data.
6. Fact_Professor
Esta é a fato principal do modelo, onde ficam armazenadas as transações ou ocorrências. Cada registro nesta tabela representa uma instância de um professor ministrando uma disciplina específica para um curso, dentro de um departamento, em uma data particular. Também inclui métricas como o número de horas de aula e o salário.

Relacionamento:
N para 1 com Professor: Vários registros podem compartilhar o mesmo professor.
N para 1 com Curso: Vários registros podem compartilhar o mesmo curso.
N para 1 com Departamento: Vários registros podem compartilhar o mesmo departamento.
N para 1 com Disciplina: Vários registros podem compartilhar a mesma disciplina.
N para 1 com Dimensao_Data: Vários registros podem compartilhar a mesma data.

Resumo dos Relacionamentos:
Professor -> Fact_Professor: 1 para N (Um professor pode ministrar várias disciplinas ao longo do tempo)
Curso -> Fact_Professor: 1 para N (Um curso pode ter várias ofertas de disciplinas, mas uma oferta pertence a um único curso)
Departamento -> Fact_Professor: 1 para N (Um departamento pode ter vários professores ensinando disciplinas diferentes)
Disciplina -> Fact_Professor: 1 para N (Uma disciplina pode ser ministrada por vários professores)
Dimensao_Data -> Fact_Professor: 1 para N (Uma data pode estar relacionada a várias ofertas de disciplinas)
