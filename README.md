# QA API Automation (ServeRest)

Projeto de automação de testes de API usando **Robot Framework** contra a API **ServeRest** rodando localmente via Docker.

Estruturado seguindo o **Resource Layer Pattern**, com separação clara entre keywords de API, variáveis por ambiente (dev/prod) e suítes de teste organizadas por tipo. Inclui pipeline de CI/CD via GitHub Actions com execução automática e geração de relatórios HTML.

![CI](https://github.com/<seu-usuario>/qa-api-automation/actions/workflows/robot.yml/badge.svg)

---

## 🛠️ Stack

- **Robot Framework** + RequestsLibrary
- **Docker** + Docker Compose
- **GitHub Actions** (CI/CD)
- **Python 3.11+**

---

## 📁 Estrutura do Projeto

```
📁 .github/workflows/
│   └── robot.yml           # Pipeline de CI/CD
📁 resources/
│   ├── keywords/
│   │   └── api.resource    # Keywords reutilizáveis de chamadas de API
│   └── variables/
│       ├── dev.resource    # Variáveis de ambiente de desenvolvimento
│       └── prod.resource   # Variáveis de ambiente de produção
📁 tests/
│   └── smoke/
│       ├── serverest_smoke.robot       # Testes smoke da API ServeRest
│       └── postman_collection.robot    # Testes baseados em coleção Postman
📁 results/                 # Relatórios gerados após execução
📄 docker-compose.yml       # Configuração da API ServeRest
📄 requirements.txt         # Dependências Python
📄 robotframework.conf      # Configuração do Robot Framework
```

---

## 🏗️ Design Pattern

O projeto utiliza o **Resource Layer Pattern**, separando responsabilidades em camadas:

- **Keywords Layer** (`resources/keywords/`) — abstração das chamadas HTTP, facilitando reuso e manutenção
- **Variables Layer** (`resources/variables/`) — configuração centralizada por ambiente, permitindo alternância entre dev e prod sem alteração nos testes
- **Test Layer** (`tests/`) — suítes organizadas por tipo (smoke), focadas apenas na lógica de teste

---

## ✅ Pré-requisitos

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [Python 3.11+](https://www.python.org/)
- [GitHub CLI](https://cli.github.com/) *(opcional)*

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
- Gera e publica os relatórios de resultado

---

## 📋 Cobertura de Testes

### Smoke Tests — ServeRest
- [ ] `POST /login` — Autenticação de usuário
- [ ] `GET /usuarios` — Listagem de usuários
- [ ] `POST /usuarios` — Criação de usuário
- [ ] `GET /produtos` — Listagem de produtos
- [ ] `POST /produtos` — Criação de produto
- [ ] `GET /carrinhos` — Listagem de carrinhos

> 🚧 Projeto em andamento — novos cenários sendo adicionados progressivamente.

---

## 📌 Sobre

Projeto desenvolvido para estudo e demonstração de boas práticas em automação de testes de API com Robot Framework, incluindo organização por design pattern, suporte a múltiplos ambientes e integração contínua.