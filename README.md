# QA API Automation (ServeRest)

Projeto de automação de testes de API usando **Robot Framework** contra a API **ServeRest** rodando localmente via Docker.

[![CI](https://github.com/edmarq1/qa-api-automation/actions/workflows/robot.yml/badge.svg)](https://github.com/edmarq1/qa-api-automation/actions/workflows/robot.yml)

## Stack
- Robot Framework + RequestsLibrary
- Docker + Docker Compose
- GitHub Actions (CI/CD)

## Pré-requisitos
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [Python 3.11+](https://www.python.org/downloads/)
- [GitHub CLI](https://cli.github.com/) (opcional)

## 🚀 Subir a API (ServeRest)
```bash
docker compose up -d
