# QA API Automation (ServeRest)

Projeto de automação de testes de API usando **Robot Framework** contra a API **ServeRest** rodando localmente via Docker.

Estruturado seguindo o **Resource Layer Pattern**, com separação clara entre keywords de API, variáveis por ambiente (dev/prod) e suítes de teste organizadas por tipo. Inclui pipeline de CI/CD via GitHub Actions com execução automática e geração de relatórios HTML.

![CI](https://github.com/edmarq1/qa-api-automation/actions/workflows/robot.yml/badge.svg)

---

## 🛠️ Stack

- **Robot Framework** + RequestsLibrary + FakerLibrary
- **Docker** + Docker Compose
- **GitHub Actions** (CI/CD)
- **Python 3.12+**

---

## 📁 Estrutura do Projeto

```
📁 .github/workflows/
│   └── robot.yml                   # Pipeline de CI/CD
📁 resources/
│   ├── keywords/
│   │   ├── api.resource            # Keywords reutilizáveis de chamadas de API
│   │   └── data.resource           # Keywords de geração de dados com FakerLibrary
│   └── variables/
│       ├── dev.resource            # Variáveis de ambiente de desenvolvimento
│       └── prod.resource           # Variáveis de ambiente de produção
📁 tests/
│   └── smoke/
│       └── serverest_smoke.robot   # Testes smoke da API ServeRest
📁 results/                         # Relatórios gerados após execução
📄 .actrc                           # Configuração para execução local com act
📄 docker-compose.yml               # Configuração da API ServeRest
📄 requirements.txt                 # Dependências Python
📄 robotframework.conf              # Configuração do Robot Framework
```

---

## 🏗️ Design Pattern

O projeto utiliza o **Resource Layer Pattern**, separando responsabilidades em camadas:

- **Keywords Layer** (`resources/keywords/`) — abstração das chamadas HTTP e geração de dados, facilitando reuso e manutenção
- **Variables Layer** (`resources/variables/`) — configuração centralizada por ambiente, permitindo alternância entre dev e prod sem alteração nos testes
- **Test Layer** (`tests/`) — suítes organizadas por tipo (smoke), focadas apenas na lógica de teste

---

## ✅ Pré-requisitos

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [Python 3.12+](https://www.python.org/)
- [act](https://github.com/nektos/act) *(opcional — para rodar o pipeline GitHub Actions localmente)*

---

## 🚀 Como executar

### 1. Suba a API ServeRest via Docker

```bash
docker compose up -d
```

### 2. Instale as dependências

```bash
pip install -r requirements.txt
```

### 3. Execute os testes

**Ambiente de desenvolvimento:**
```bash
robot -V resources/variables/dev.resource tests/
```

**Ambiente de produção:**
```bash
robot -V resources/variables/prod.resource tests/
```

### 4. Visualize o relatório

Após a execução, os relatórios são gerados na pasta `results/`:

```
results/
├── log.html      # Log detalhado de execução
├── report.html   # Relatório geral
└── output.xml    # Output para integração com outras ferramentas
```

Abra o `results/report.html` no navegador para visualizar os resultados.

---

## 🔄 CI/CD

O projeto conta com pipeline automatizado via **GitHub Actions** (`.github/workflows/robot.yml`), que:

- Executa os testes automaticamente a cada push ou pull request
- Sobe a API ServeRest via Docker antes da execução
- Gera e publica os relatórios de resultado como artifacts (disponíveis por 7 dias)

### Rodando o pipeline localmente com act

O projeto inclui suporte ao [act](https://github.com/nektos/act) para rodar o pipeline localmente sem precisar fazer push:

```bash
act workflow_dispatch -j test
```

> O `.actrc` já está configurado para compatibilidade com o ambiente local.

---

## 📋 Cobertura de Testes

### Smoke Tests — ServeRest
- [x] `GET /status` — Verifica se a API está acessível (local only)
- [x] `GET /usuarios` — Valida que a listagem de usuários retorna status 200
- [x] `GET /produtos` — Valida que a listagem de produtos retorna status 200
- [x] `GET /carrinhos` — Valida que a listagem de carrinhos retorna status 200
- [x] `POST /usuarios` — Criação de usuário com dados gerados via FakerLibrary
- [x] `POST /login` — Autenticação com usuário pré-cadastrado

> 🚧 Projeto em andamento — novos cenários sendo adicionados progressivamente.

---

## 📌 Sobre

Projeto desenvolvido para estudo e demonstração de boas práticas em automação de testes de API com Robot Framework, incluindo organização por design pattern, suporte a múltiplos ambientes e integração contínua.