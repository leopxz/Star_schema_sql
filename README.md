# Star Schema - Análise da tabela Fact_Professor 

## Contexto
Este projeto tem como objetivo criar um modelo dimensional (Star Schema) baseado em um diagrama relacional para análise de dados dos professores de uma universidade. A ideia principal é permitir a análise de métricas relacionadas aos professores, como cursos ministrados, departamentos envolvidos, disciplinas oferecidas e dados temporais. O foco da modelagem está no professor como o objeto de análise, excluindo dados sobre os alunos.

A modelagem inclui uma tabela fato (Fact_Professor) e várias tabelas de dimensões, como professores, cursos, departamentos, disciplinas e datas. O modelo foi construído com base em um diagrama relacional existente e organizado de forma a facilitar a consulta e análise em ferramentas como Power BI ou outros sistemas de BI.

## Configuração
Requisitos
Para replicar o projeto, é necessário configurar um ambiente de banco de dados relacional (ex: MySQL, PostgreSQL ou SQL Server). Os seguintes passos são recomendados para configuração:

Instale o sistema de gerenciamento de banco de dados (SGBD) de sua escolha.<br>
Configure um banco de dados para o projeto, por exemplo: base_powerbi.<br>
Execute os scripts SQL fornecidos para criar as tabelas de dimensões e fato.<br>
Popular o banco de dados utilizando os scripts de INSERT fornecidos para cada tabela.<br>

## Execução
Após configurar o banco de dados, você pode usar ferramentas de BI como Power BI para se conectar ao banco de dados e criar relatórios baseados no modelo dimensional.

Passos para Visualizar os Dados no Power BI:<br>
Abra o Power BI.<br>
Selecione Obter Dados > Banco de Dados MySQL.<br>
Insira as credenciais e o nome do banco de dados (base_powerbi).<br>
Importe as tabelas de Fact_Professor, Professor, Curso, Departamento, Disciplina e Dimensao_Data.<br>
Crie os relacionamentos conforme definido no modelo dimensional (os relacionamentos sugeridos serão baseados nas chaves primárias e estrangeiras).<br>
Visualize e crie seus relatórios e dashboards com base nas tabelas importadas.<br>

## Estrutura
A estrutura do projeto segue uma arquitetura de banco de dados dimensional com uma tabela fato central e várias tabelas de dimensões que fornecem contexto detalhado para a análise.

Tabelas
Fact_Professor: Tabela fato que armazena as métricas sobre o professor, incluindo o curso ministrado, departamento, disciplina e dados temporais. Campos principais:<br>
<br>
idProfessor: Identificador do professor.<br>
idCurso: Identificador do curso.<br>
idDepartamento: Identificador do departamento.<br>
idDisciplina: Identificador da disciplina.<br>
idDataOfertaDisciplina: Referência à data da oferta da disciplina.<br>
HorasAula: Quantidade de horas de aula lecionadas.<br>
Salario: Salário correspondente às horas lecionadas.<br>
Dim_Professor: Armazena os detalhes dos professores.<br>
<br>
 Exemplo de campos:<br>
<br>
idProfessor: Identificador único do professor.<br>
NomeProfessor: Nome do professor.<br>
Especialidade: Área de especialidade do professor.<br>
DataContratacao: Data de contratação do professor.<br>
Nivel: Nível do professor (ex: Júnior, Pleno, Sênior).<br>
Dim_Curso: Detalha os cursos oferecidos. Campos principais:<br>
<br>
idCurso: Identificador único do curso.<br>
NomeCurso: Nome do curso.<br>
Duracao: Duração em meses.<br>
DataInicio: Data de início do curso.<br>
Dim_Departamento: Informações sobre os departamentos da universidade. <br>
<br>
Campos principais:<br>
<br>
idDepartamento: Identificador único do departamento.<br>
NomeDepartamento: Nome do departamento.<br>
Campus: Nome do campus ao qual o departamento pertence.<br>
Coordenador: Nome do professor coordenador do departamento.<br>
Dim_Disciplina: Detalhes das disciplinas oferecidas. <br>
<br>
Exemplo de campos:<br>
<br>
idDisciplina: Identificador único da disciplina.<br>
NomeDisciplina: Nome da disciplina.<br>
CargaHoraria: Carga horária total da disciplina.<br>
PreRequisitos: Pré-requisitos da disciplina (se houver).<br>
Dimensao_Data: Tabela de dimensão temporal que armazena as datas de oferta das disciplinas.<br>
<br>
Exemplo de campos:<br>
<br>
idData: Identificador da data.<br>
Dia: O dia da oferta.<br>
Mes: O mês da oferta.<br>
Ano: O ano da oferta.<br>
Trimestre: Trimestre correspondente.<br>
Semestre: Semestre correspondente.<br>

## Explicando as relações das tabelas

1. Professor<br>
Essa tabela contém informações detalhadas sobre os professores, como o nome, especialidade, data de contratação e nível.<br>

Relacionamento:<br>
1 para N com Fact_Professor: Um professor pode ser associado a várias disciplinas ao longo do tempo, mas uma linha na Fact_Professor está relacionada a um único professor.<br>
2. Curso<br>
Contém informações sobre os cursos oferecidos pela instituição, como nome, duração e data de início.<br>
<br>
Relacionamento:<br>
1 para N com Fact_Professor: Um curso pode ter vários professores associados, mas uma linha na Fact_Professor corresponde a um único curso.<br>
3. Departamento<br>
Esta tabela armazena os dados sobre os departamentos, incluindo o nome, campus e o coordenador.<br>
<br>
Relacionamento:<br>
1 para N com Fact_Professor: Um departamento pode ter vários professores associados, mas um professor (via Fact_Professor) pertence a um único departamento em uma oferta de disciplina específica.<br>
4. Disciplina<br>
Essa tabela contém informações sobre as disciplinas, como o nome, carga horária e pré-requisitos.<br>
<br>
Relacionamento:<br>
1 para N com Fact_Professor: Uma disciplina pode ser ministrada por vários professores em diferentes momentos, mas uma entrada em Fact_Professor corresponde a uma disciplina específica.<br>
5. Dimensao_Data<br>
Esta tabela armazena a dimensão de data, útil para registrar quando uma disciplina foi oferecida. Inclui campos como o dia, mês, ano, trimestre e semestre.<br>
<br>
Relacionamento:<br>
1 para N com Fact_Professor: Uma data pode estar relacionada a várias ofertas de disciplinas (Fact_Professor), mas uma oferta específica de disciplina está associada a uma única data.<br>
6. Fact_Professor<br>
Esta é a fato principal do modelo, onde ficam armazenadas as transações ou ocorrências. Cada registro nesta tabela representa uma instância de um professor ministrando uma disciplina específica para um curso, dentro de um departamento, em uma data particular. Também inclui métricas como o número de horas de aula e o salário.<br>
<br>
Relacionamento:<br>
N para 1 com Professor: Vários registros podem compartilhar o mesmo professor.<br>
N para 1 com Curso: Vários registros podem compartilhar o mesmo curso.<br>
N para 1 com Departamento: Vários registros podem compartilhar o mesmo departamento.<br>
N para 1 com Disciplina: Vários registros podem compartilhar a mesma disciplina.<br>
N para 1 com Dimensao_Data: Vários registros podem compartilhar a mesma data.<br>
<br>
Resumo dos Relacionamentos:<br>
Professor -> Fact_Professor: 1 para N (Um professor pode ministrar várias disciplinas ao longo do tempo)<br>
Curso -> Fact_Professor: 1 para N (Um curso pode ter várias ofertas de disciplinas, mas uma oferta pertence a um único curso)<br>
Departamento -> Fact_Professor: 1 para N (Um departamento pode ter vários professores ensinando disciplinas diferentes)<br>
Disciplina -> Fact_Professor: 1 para N (Uma disciplina pode ser ministrada por vários professores)<br>
Dimensao_Data -> Fact_Professor: 1 para N (Uma data pode estar relacionada a várias ofertas de disciplinas)<br>

## Tabela no MySQL

![image](https://github.com/user-attachments/assets/ff085609-0ce4-495f-a255-ab375bd8397c)

