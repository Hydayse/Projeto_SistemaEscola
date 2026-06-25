# Projeto_SistemaEscola

Link: [https://trello.com/invite/b/6a329ecce0a26f57af102ad6/ATTI550a7e8b55edf306ce9dc18f9bf7a0b94A1C4480/projeto]

# Estrutura proposta (raiz do repositório)

- README.md — visão geral do projeto, como rodar o sistema, stack, contatos e badges.
- LICENSE — licença do projeto (ex.: MIT, Apache-2.0).
- .gitignore — padrões (IDE, build, .env).
- docs/ — documentação do projeto.
    - 01-Project-Scope.md — escopo do projeto (objetivos, entregáveis, exclusões, stakeholders).
    - 02-Requirements.md — requisitos (funcionais e não-funcionais) e rastreabilidade.
    - 03-Business-Rules.md — regras de negócio.
    - 04-Architecture.md — visão arquitetural (camadas, padrões, decisões arquiteturais).
    - 05-Data-Model.md — modelo de dados (ERD, tabelas principais, DDL base).
    - 06-Use-Cases.md — casos de uso e descrições (atores, fluxos principal/alternativos).
    - 07-APIs.md — contratos de API (endpoints, inputs, outputs, exemplos).
    - 08-NonFunctional.md — requisitos não funcionais detalhados (segurança, desempenho, backup).
    - 09-Test-Plan.md — plano de testes, critérios de aceitação, matriz de cobertura
    - 10-Deployment.md — instruções de deploy, infra (Docker, Kubernetes, DB), requisitos de SO.
    - 11-Roadmap.md — cronograma e milestones.
    - images/ — diagramas PNG/SVG referenciados nos documentos.
    - diagrams/ — arquivos fonte de diagramas (drawio, astah, plantuml).
- design/ — protótipos e telas (Figma link ou assets exportados).
- src/ — código-fonte (estrutura do projeto). (opcional em repos separados)
- infra/ — scripts de infra (docker-compose, terraform, ansible).
- tests/ — casos de teste automatizados e dados de teste.
- CHANGELOG.md — histórico de versões.

# Exemplos de conteúdo (sintético) para arquivos-chave

- 01-Project-Scope.md
    - Objetivo: automatizar matrículas, lançamento de notas e consultas de boletim; reduzir trabalho manual da secretaria; gerar relatórios para gestão.
    - Entregáveis: API REST, front-end responsivo, banco MySQL, documentação, testes e scripts de deploy.
    - Exclusões: integração com sistemas externos de folha de pagamento (escopo futuro).
    - Stakeholders: Alunos, Professores, Secretaria, Gestor, Equipe de TI.
- 02-Requirements.md
    - Requisitos funcionais (exemplos a adaptar): RF001 Gerenciar cursos/disciplinas; RF002 Alocação de turmas; RF003 Processamento de matrícula; RF004 Registro de frequência; RF005 Lançamento de notas; RF006 Consolidação de semestre; RF007 Emissão de relatórios; RF008 Consulta ao boletim. (mapear ID, descrição, prioridade, aceitação, responsável).
    - Requisitos não-funcionais (exemplos): controle de acesso por papéis, tempo de resposta para cálculo em lote, responsividade mobile, integridade referencial no BD, padrão MVC, SO Ubuntu + MySQL 8.0.
- 03-Business-Rules.md
    - Exemplos: um aluno não pode ter >1 matrícula ativa na mesma disciplina/semestre; notas entre 0.00 e 10.00; média calculada automaticamente; status 'Concluído' só com média >=6.00 e faltas dentro do permitido; somente Gestor pode homologar fechamento de semestre.

# Diagramas recomendados e onde colocá‑los

- docs/images/UseCase-Principal.png — Diagrama de Casos de Uso com atores: Aluno, Professor, Secretaria, Gestor.
- docs/images/Class-Diagram.png — Diagrama de classes principais: Aluno, Professor, Curso, Disciplina, Turma, Matrícula, Nota, Frequência.
- docs/images/ERD.png — Diagrama entidade-relacionamento (tabelas: ALUNOS, PROFESSORES, CURSOS, DISCIPLINAS, TURMAS, MATRICULAS, NOTAS, FREQUENCIAS).
- docs/images/Sequence-RegisterGrade.png — Diagrama de sequência (Professor lança nota → sistema valida regras → atualiza média → registra auditoria).
- docs/images/Component-Architecture.png — Diagrama de componentes (Frontend, API Gateway, Serviços, DB, Auth).
- docs/diagrams/*.drawio / *.plantuml / *.asta h — arquivos fontes para edição.

Modelo rápido de Use Case (para docs/07-Use-Cases.md)

- UC002 Consultar Boletim
    - Ator: Aluno. Pré-condição: aluno cadastrado e autenticado. Fluxo principal: aluno solicita boletim → sistema recupera matrículas, notas e frequência → sistema calcula médias finais → exibe boletim. Pós-condição: consulta registrada em log de auditoria. Regras de negócio: RN002, RN006.
# Sugestões práticas para o GitHub (pull requests e templates)

- .github/PULL_REQUEST_TEMPLATE.md — checklist: link da issue, testes executados, captura de tela, migration/rollback.
- .github/ISSUE_TEMPLATE/feature_request.md e bug_report.md — templates com campos de prioridade, passos para reproduzir, impacto.
- CONTRIBUTING.md — processo de contribuição, convenção de commits (ex.: Conventional Commits), revisão de código, CI/CD.

# Checklist de documentação mínima para primeira entrega (milestone inicial)

- README + 01-Project-Scope.md + 02-Requirements.md + 03-Business-Rules.md + ERD e Use Case PNG + Diagrama de Componentes + .github templates + Deployment básico (docker-compose).
Exemplo de README (resumo)

- Curta descrição do objetivo do sistema, tecnologias (ex.: Node/Express, React/Vue, MySQL), como executar localmente (comandos docker-compose), onde ver documentação (docs/), como contribuir e contatos.


