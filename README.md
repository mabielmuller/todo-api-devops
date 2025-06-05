
# 📦 Todo API - DevOps

API REST simples para gerenciamento de tarefas (To-Do), desenvolvida com Node.js e Express, com foco em automação DevOps, provisionamento em nuvem e integração contínua.

---

## 🚀 Funcionalidades

- Listar tarefas (`GET /tarefas`)
- Criar novas tarefas (`POST /tarefas`)
- Dados armazenados em memória (simples para fins didáticos)

---

## 🧪 Tecnologias Utilizadas

- Node.js
- Express
- GitHub Actions (CI)
- AWS EC2 (provisionado via CloudFormation)

---

## 🔧 Como Executar Localmente

### 1. Clone o repositório:

```bash
git clone https://github.com/mabielmuller/todo-api-devops.git
cd todo-api-devops
```

### 2. Instale as dependências:

```bash
npm install
```

### 3. Inicie a aplicação:

```bash
npm start
```

A aplicação estará disponível em:

```
http://localhost:3000/tarefas
```

---

## ☁️ Execução na Nuvem (AWS)

Esta aplicação está configurada para rodar automaticamente em uma instância EC2 com Ubuntu, utilizando script de inicialização no CloudFormation.

### Stack Provisionada

- EC2 t2.micro com Ubuntu 22.04
- Porta 3000 aberta para acesso à API
- Clonagem automática do repositório e execução da API

### Acesso à API:

```
http://[IP-da-instância]:3000/tarefas
```

---

## 🔄 CI - Integração Contínua

O projeto conta com um pipeline GitHub Actions:

- Executa a cada push na branch `main`
- Instala dependências e prepara para testes automatizados

Arquivo de configuração: `.github/workflows/ci.yml`

---

## 📁 Estrutura do Projeto

```
todo-api-devops/
├── src/
│   └── index.js       # API principal
├── .github/
│   └── workflows/
│       └── ci.yml     # Pipeline de CI
├── package.json
├── cloudformation-template.yml
└── README.md
```

---

## 🔐 Acesso SSH

Para fins educacionais, o provisionamento utiliza um par de chaves EC2:
- Nome do par: `minha-chave-devops.pem`

---

## ✍️ Autor

Projeto desenvolvido por **Mabiel Muller** como parte da Fase 1 do curso de DevOps.
