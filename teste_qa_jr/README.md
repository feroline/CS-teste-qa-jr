# Teste Técnico

### 1. DESCRIÇÃO
Este documento tem como objetivo avaliar suas habilidades e conhecimentos fundamentais na área de QA. Através deste teste buscamos entender sua capacidade de identificar e relatar bugs, criar casos de teste, criar testes de frontend e backend, criar teste automatizados e aplicar práticas de teste de maneira eficiente e eficaz.

Durante a realização do teste, você será avaliado sob as seguintes competências:

- **Identificação e descrição de bugs**: Sua habilidade em encontrar e descrever bugs de forma clara e detalhada.
- **Sinalização de melhorias**: Sua capacidade de apontar melhorias referente ao produto de forma coesa e explicativa.
- **Criação de casos de teste**: Sua capacidade de elaborar casos de teste em BDD que cobrem os diversos cenários existentes na aplicação.
- **Testes automatizados**: Sua capacidade de desenvolver e executar de forma lógica testes automatizados.
- **Documentação**: Sua habilidade em documentar os processos e resultados de testes de maneira organizada.

### 2. CONFIGURAÇÃO DO AMBIENTE
*É necessário a instalação do **Docker** na máquina.*

Preferencialmente, utilize alguma distribuição **Linux** para a configuração do ambiente e realização dos testes.


1. Descompacte o projeto enviado por e-mail e acesse a pasta raiz do projeto via terminal.

2. Dentro da pasta raiz do projeto você deve rodar o seguinte comando: `docker-compose up --build -d`.

3. Após o comando ser rodado, você poderá acessar a aplicação pela **URL**: `http://localhost:5400`.

Outros endpoints que irá expor ao subir o projeto:
- **Banco de dados (MySQL):** `port 3400`
- **Backend (PHP):** `port 8400`

O projeto pode demorar para ser inicializado.
**Após executar pela primeira vez** o comando acima, pode deve subir o ambiente local pelo seguinte comando: `docker-compose up -d`

### 3. TESTE
O projeto consiste em um CRUD de usuários para um grupo que contém diversas empresas.

Seu desafio será testar o projeto por completo, documentando o máximo de cenários possíveis que encontrar, desenvolver os testes automatizados para o projeto e criar os testes de API sobre as rotas disponibilizadas na área API.

O formulário de cadastro deve conter os campos de Nome, E-mail, Telefone, Data e Empresa como preenchimento obrigatório para realização do cadastro.

Abaixo você encontrará instruções que deve seguir:

- **Casos de teste**: Os casos devem ser documentados em BDD utilizando Gherkin para a documentação.
- **Teste automatizado**: O tipo de teste automatizado avaliado será o E2E. De preferência, utilize o framework Cypress para criação dos testes.
- **Testes de API**: Os testes de API devem ser documentados no formato BDD com Gherkin. De preferência, utilize o framework Postman ou Insomnia para a criação das rotas.

### 4. API

### Home Route
---
- **Path:** `/`
- **Parameters:** None
- **HTTP Method:** GET
- **Body:** None
- **Possible Returns:**
 - 200: `{"msg": "home"}`

### User Routes
---
#### Get All Users
- **Path:** `/api/user`
- **Parameters:** None
- **HTTP Method:** GET
- **Body:** None
- **Possible Returns:**
 - 200: List of users

#### Get User by ID
- **Path:** `/api/user/{id}`
- **Parameters:**
 - `id`: User ID
- **HTTP Method:** GET
- **Body:** None
- **Possible Returns:**
 - 200: User data
 - 400: Bad request
 - 500: Internal server error

#### Create User
- **Path:** `/api/user/create`
- **Parameters:** None
- **HTTP Method:** POST
- **Body:**
 ```json
 {
     "name": "string",
     "e-mail": "string",
     "companies": ["string"]
 }
 ```
- **Possible Returns:**
 - 201: Created user data
 - 400: Bad request
 - 500: Internal server error

#### Update User
- **Path:** `/api/user/{id}/update`
- **Parameters:**
 - `id`: User ID
- **HTTP Method:** PATCH
- **Body:**
 ```json
 {
     "name": "string",
     "e-mail": "string",
     "companies": ["string"]
 }
 ```
- **Possible Returns:**
 - 200: Updated user data
 - 400: Bad request
 - 500: Internal server error

#### Delete User
- **Path:** `/api/user/{id}/delete`
- **Parameters:**
 - `id`: User ID
- **HTTP Method:** DELETE
- **Body:** None
- **Possible Returns:**
 - 200: Deletion confirmation
 - 400: Bad request
 - 500: Internal server error

### Company Routes
---
#### Get All Companies
- **Path:** `/api/company`
- **Parameters:** None
- **HTTP Method:** GET
- **Body:** None
- **Possible Returns:**
 - 200: List of companies

#### Get Company by ID
- **Path:** `/api/company/{id}`
- **Parameters:**
 - `id`: Company ID
- **HTTP Method:** GET
- **Body:** None
- **Possible Returns:**
 - 200: Company data
 - 400: Bad request
 - 500: Internal server error

#### Create Company
- **Path:** `/api/company/create`
- **Parameters:** None
- **HTTP Method:** POST
- **Body:**
 ```json
 {
     "name": "string",
     "cnpj": "string",
     "adress": {
         "cep": "string",
         "country": "string",
         "city": "string",
         "street_location": "string",
         "number": "string",
         "district": "string"
    }
 }
 ```
- **Possible Returns:**
 - 201: Created company data
 - 400: Bad request
 - 500: Internal server error

#### Update Company
- **Path:** `/api/company/{id}/update`
- **Parameters:**
 - `id`: Company ID
- **HTTP Method:** PATCH
- **Body:**
 ```json
 {
     "name": "string",
     "cnpj": "string",
     "adress": {
         "cep": "string",
         "country": "string",
         "state": "string",
         "city": "string",
         "street": "string",
         "number": "string",
         "district": "string"
    }
 }
 ```
- **Possible Returns:**
 - 200: Updated company data
 - 400: Bad request
 - 500: Internal server error

#### Delete Company
- **Path:** `/api/company/{id}/delete`
- **Parameters:**
 - `id`: Company ID
- **HTTP Method:** DELETE
- **Body:** None
- **Possible Returns:**
 - 200: Deletion confirmation
 - 400: Bad request
 - 500: Internal server error

### 5. COMO ENTREGAR O PROJETO
Para enviar seu projeto, siga os passos abaixo. É crucial o envio de todas as partes do teste para a sua avaliação seja completa.

1. **Repositório no GitHub**: Crie um repositório público no GitHub e forneça o link do repositório por e-mail.

2. **Documentação**: Envie a documentação como anexo no e-mail ou disponibilize-a publicamente se estiver usando uma plataforma de documentação.

3. **Teste de API**: As rotas criadas para o teste de API devem ser exportadas e enviadas em um arquivo com extensão `.json`. Preferencialmente, utilize as ferramentas Postman ou Insomnia para exportar as rotas.
