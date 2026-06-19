CREATE DATABASE escola_de_nivel_media_tecnica;
USE escola_de_nivel_media_tecnica;

========================================================
1. TABELAS INDEPENDENTES (Não possuem chaves estrangeiras)
========================================================

CREATE TABLE CURSOS (
    id_curso INT PRIMARY KEY,
    nome VARCHAR(100),
    nivel VARCHAR(50)
);

CREATE TABLE PROFESSORES (
    id_professor INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE ALUNOS (
    id_aluno INT PRIMARY KEY,
    nome VARCHAR(100),
    data_nascimento DATE,
    sexo VARCHAR(20)
);

===================================
 2. TABELAS DEPENDENTES DE 1º NÍVEL
===================================

CREATE TABLE DISCIPLINAS (
    id_disciplina INT PRIMARY KEY,
    nome VARCHAR(100),
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES CURSOS(id_curso)
);

===================================
3. TABELAS DEPENDENTES DE 2º NÍVEL
===================================

CREATE TABLE TURMAS (
    id_turma INT PRIMARY KEY,
    ano INT,
    semestre INT,
    id_disciplina INT,
    id_professor INT,
    FOREIGN KEY (id_disciplina) REFERENCES DISCIPLINAS(id_disciplina),
    FOREIGN KEY (id_professor) REFERENCES PROFESSORES(id_professor)
);

======================================================
4. TABELAS DEPENDENTES DE 3º NÍVEL (O coração do sistema)
======================================================

CREATE TABLE MATRICULAS (
    id_matricula INT PRIMARY KEY,
    id_aluno INT,
    id_turma INT,
    status VARCHAR(50),
    FOREIGN KEY (id_aluno) REFERENCES ALUNOS(id_aluno),
    FOREIGN KEY (id_turma) REFERENCES TURMAS(id_turma)
);

=======================================================
5. TABELAS DEPENDENTES DE 4º NÍVEL (Avaliação e Presença) =======================================================

CREATE TABLE NOTAS (
    id_nota INT PRIMARY KEY,
    id_matricula INT,
    nota1 DECIMAL(5,2),
    nota2 DECIMAL(5,2),
    nota3 DECIMAL(5,2),
    media DECIMAL(5,2),
    FOREIGN KEY (id_matricula) REFERENCES MATRICULAS(id_matricula)
);

CREATE TABLE FREQUENCIA (
    id_frequencia INT PRIMARY KEY,
    id_matricula INT,
    data_aula DATE,
    presenca VARCHAR(20),
    FOREIGN KEY (id_matricula) REFERENCES MATRICULAS(id_matricula)
);

------------------------------------
INSERINDO 20 CURSOS
------------------------------------
INSERT INTO CURSOS (id_curso, nome, nivel) VALUES
(1, 'Técnico em Informática', 'Médio Técnico'),
(2, 'Técnico em Eletrotécnica', 'Médio Técnico'),
(3, 'Técnico em Enfermagem', 'Médio Técnico'),
(4, 'Técnico em Administração', 'Médio Técnico'),
(5, 'Técnico em Mecânica', 'Médio Técnico'),
(6, 'Técnico em Edificações', 'Médio Técnico'),
(7, 'Técnico em Logística', 'Médio Técnico'),
(8, 'Técnico em Química', 'Médio Técnico'),
(9, 'Técnico em Nutrição', 'Médio Técnico'),
(10, 'Técnico em Segurança do Trabalho', 'Médio Técnico'),
(11, 'Técnico em Meio Ambiente', 'Médio Técnico'),
(12, 'Técnico em Design Gráfico', 'Médio Técnico'),
(13, 'Técnico em Contabilidade', 'Médio Técnico'),
(14, 'Técnico em Redes de Computadores', 'Médio Técnico'),
(15, 'Técnico em Turismo', 'Médio Técnico'),
(16, 'Técnico em Agropecuária', 'Médio Técnico'),
(17, 'Técnico em Estética', 'Médio Técnico'),
(18, 'Técnico em Automação Industrial', 'Médio Técnico'),
(19, 'Técnico em Recursos Humanos', 'Médio Técnico'),
(20, 'Técnico em Telecomunicações', 'Médio Técnico');

----------------------------------------------
INSERINDO 20 PROFESSORES
----------------------------------------------
INSERT INTO PROFESSORES (id_professor, nome, email) VALUES
(1, 'Carlos Silva', 'carlos.silva@escola.br'),
(2, 'Ana Paula Gomes', 'ana.gomes@escola.br'),
(3, 'Marcos Pereira', 'marcos.pereira@escola.br'),
(4, 'Juliana Castro', 'juliana.castro@escola.br'),
(5, 'Roberto Mendes', 'roberto.mendes@escola.br'),
(6, 'Fernanda Costa', 'fernanda.costa@escola.br'),
(7, 'Lucas Santos', 'lucas.santos@escola.br'),
(8, 'Beatriz Alves', 'beatriz.alves@escola.br'),
(9, 'Ricardo Lima', 'ricardo.lima@escola.br'),
(10, 'Camila Rocha', 'camila.rocha@escola.br'),
(11, 'Eduardo Martins', 'eduardo.martins@escola.br'),
(12, 'Patricia Ribeiro', 'patricia.ribeiro@escola.br'),
(13, 'Gustavo Carvalho', 'gustavo.carvalho@escola.br'),
(14, 'Amanda Souza', 'amanda.souza@escola.br'),
(15, 'Felipe Oliveira', 'felipe.oliveira@escola.br'),
(16, 'Larissa Ferreira', 'larissa.ferreira@escola.br'),
(17, 'Rodrigo Monteiro', 'rodrigo.monteiro@escola.br'),
(18, 'Vanessa Nogueira', 'vanessa.nogueira@escola.br'),
(19, 'Tiago Barros', 'tiago.barros@escola.br'),
(20, 'Mariana Teixeira', 'mariana.teixeira@escola.br');


------------------------------------
INSERINDO 20 ALUNOS
------------------------------------
INSERT INTO ALUNOS (id_aluno, nome, data_nascimento, sexo) VALUES
(1, 'João Pedro Silva', '2005-03-15', 'Masculino'),
(2, 'Maria Clara Dias', '2006-07-22', 'Feminino'),
(3, 'Pedro Henrique Nunes', '2005-11-05', 'Masculino'),
(4, 'Ana Beatriz Lopes', '2006-01-18', 'Feminino'),
(5, 'Lucas Gabriel Faria', '2004-09-30', 'Masculino'),
(6, 'Julia Cavalcante', '2005-12-12', 'Feminino'),
(7, 'Mateus Almeida', '2006-04-25', 'Masculino'),
(8, 'Laura Mendes', '2005-08-08', 'Feminino'),
(9, 'Gabriel Viana', '2004-02-14', 'Masculino'),
(10, 'Isabella Castro', '2006-06-03', 'Feminino'),
(11, 'Enzo Moraes', '2005-10-21', 'Masculino'),
(12, 'Manuela Rocha', '2006-05-17', 'Feminino'),
(13, 'Rafael Peixoto', '2004-11-29', 'Masculino'),
(14, 'Giovanna Barbosa', '2005-02-02', 'Feminino'),
(15, 'Guilherme Pinto', '2006-09-11', 'Masculino'),
(16, 'Sofia Guimarães', '2005-07-07', 'Feminino'),
(17, 'Thiago Assis', '2004-04-19', 'Masculino'),
(18, 'Luiza Freitas', '2006-12-05', 'Feminino'),
(19, 'Arthur Vieira', '2005-01-28', 'Masculino'),
(20, 'Valentina Pires', '2006-08-14', 'Feminino');

-----------------------------------------------------------------------------------
INSERINDO 20 DISCIPLINAS (Ligadas aos cursos 1 a 20)
-----------------------------------------------------------------------------------
INSERT INTO DISCIPLINAS (id_disciplina, nome, id_curso) VALUES
(1, 'Lógica de Programação', 1),
(2, 'Circuitos Elétricos', 2),
(3, 'Primeiros Socorros', 3),
(4, 'Teoria Geral da Administração', 4),
(5, 'Sistemas Hidráulicos', 5),
(6, 'Desenho Arquitetônico', 6),
(7, 'Gestão de Estoques', 7),
(8, 'Química Orgânica', 8),
(9, 'Dietética', 9),
(10, 'Ergonomia', 10),
(11, 'Gestão de Resíduos Sólidos', 11),
(12, 'Tipografia', 12),
(13, 'Contabilidade de Custos', 13),
(14, 'Protocolos de Roteamento', 14),
(15, 'Gestão Hoteleira', 15),
(16, 'Manejo de Solo', 16),
(17, 'Cosmetologia', 17),
(18, 'CLP (Controlador Lógico Programável)', 18),
(19, 'Recrutamento e Seleção', 19),
(20, 'Cabeamento Estruturado', 20);

------------------------------------------------------------------------------------------
INSERINDO 20 TURMAS (Cruzando Disciplinas e Professores)
------------------------------------------------------------------------------------------
INSERT INTO TURMAS (id_turma, ano, semestre, id_disciplina, id_professor) VALUES
(1, 2026, 1, 1, 1),
(2, 2026, 1, 2, 2),
(3, 2026, 1, 3, 3),
(4, 2026, 1, 4, 4),
(5, 2026, 1, 5, 5),
(6, 2026, 1, 6, 6),
(7, 2026, 1, 7, 7),
(8, 2026, 1, 8, 8),
(9, 2026, 1, 9, 9),
(10, 2026, 1, 10, 10),
(11, 2026, 1, 11, 11),
(12, 2026, 1, 12, 12),
(13, 2026, 1, 13, 13),
(14, 2026, 1, 14, 14),
(15, 2026, 1, 15, 15),
(16, 2026, 1, 16, 16),
(17, 2026, 1, 17, 17),
(18, 2026, 1, 18, 18),
(19, 2026, 1, 19, 19),
(20, 2026, 1, 20, 20);

-----------------------------------------------------------------------------------------
INSERINDO 20 MATRÍCULAS (Conectando Alunos e Turmas)
-----------------------------------------------------------------------------------------
INSERT INTO MATRICULAS (id_matricula, id_aluno, id_turma, status) VALUES
(1, 1, 1, 'Ativo'),
(2, 2, 2, 'Ativo'),
(3, 3, 3, 'Trancado'),
(4, 4, 4, 'Ativo'),
(5, 5, 5, 'Ativo'),
(6, 6, 6, 'Concluído'),
(7, 7, 7, 'Ativo'),
(8, 8, 8, 'Ativo'),
(9, 9, 9, 'Ativo'),
(10, 10, 10, 'Ativo'),
(11, 11, 11, 'Cancelado'),
(12, 12, 12, 'Ativo'),
(13, 13, 13, 'Ativo'),
(14, 14, 14, 'Ativo'),
(15, 15, 15, 'Concluído'),
(16, 16, 16, 'Ativo'),
(17, 17, 17, 'Ativo'),
(18, 18, 18, 'Ativo'),
(19, 19, 19, 'Ativo'),
(20, 20, 20, 'Ativo');


-------------------------------------------------------------------------------------------------
INSERINDO 20 REGISTROS DE NOTAS (Vinculados às Matrículas)
Calculando a média (nota1 + nota2 + nota3) / 3
-------------------------------------------------------------------------------------------------
INSERT INTO NOTAS (id_nota, id_matricula, nota1, nota2, nota3, media) VALUES
(1, 1, 8.50, 7.00, 9.00, 8.16),
(2, 2, 6.00, 7.50, 8.00, 7.16),
(3, 3, 0.00, 0.00, 0.00, 0.00), -- Aluno Trancado
(4, 4, 9.50, 9.00, 10.00, 9.50),
(5, 5, 5.50, 6.00, 7.00, 6.16),
(6, 6, 8.00, 8.00, 8.50, 8.16),
(7, 7, 7.00, 6.50, 7.50, 7.00),
(8, 8, 9.00, 9.50, 9.00, 9.16),
(9, 9, 4.50, 5.00, 6.50, 5.33),
(10, 10, 10.00, 9.50, 10.00, 9.83),
(11, 11, 4.00, 0.00, 0.00, 1.33), -- Aluno Cancelado
(12, 12, 7.50, 8.00, 7.00, 7.50),
(13, 13, 6.50, 7.00, 8.00, 7.16),
(14, 14, 8.00, 9.00, 8.50, 8.50),
(15, 15, 9.50, 10.00, 9.50, 9.66),
(16, 16, 7.00, 7.00, 7.00, 7.00),
(17, 17, 5.00, 6.50, 7.00, 6.16),
(18, 18, 8.50, 8.50, 9.00, 8.66),
(19, 19, 9.00, 8.00, 8.50, 8.50),
(20, 20, 10.00, 10.00, 9.50, 9.83);

--------------------------------------------------------------------
INSERINDO 20 REGISTROS DE FREQUÊNCIA
Simulando a presença de todos os matriculados em um dia específico
--------------------------------------------------------------------
INSERT INTO FREQUENCIA (id_frequencia, id_matricula, data_aula, presenca) VALUES
(1, 1, '2026-05-10', 'Presente'),
(2, 2, '2026-05-10', 'Presente'),
(3, 3, '2026-05-10', 'Falta'), -- Aluno Trancado
(4, 4, '2026-05-10', 'Presente'),
(5, 5, '2026-05-10', 'Presente'),
(6, 6, '2026-05-10', 'Presente'),
(7, 7, '2026-05-10', 'Falta'),
(8, 8, '2026-05-10', 'Presente'),
(9, 9, '2026-05-10', 'Presente'),
(10, 10, '2026-05-10', 'Presente'),
(11, 11, '2026-05-10', 'Falta'), -- Aluno Cancelado
(12, 12, '2026-05-10', 'Presente'),
(13, 13, '2026-05-10', 'Presente'),
(14, 14, '2026-05-10', 'Presente'),
(15, 15, '2026-05-10', 'Presente'),
(16, 16, '2026-05-10', 'Falta'),
(17, 17, '2026-05-10', 'Presente'),
(18, 18, '2026-05-10', 'Presente'),
(19, 19, '2026-05-10', 'Presente'),
(20, 20, '2026-05-10', 'Presente');


