Feature: Company
    Eu quero realizar a requisição da rota Company e poder receber todos as companias cadastradas,
    companias cadastradas por ID, criar compania, atualizar compania e deletar compania.

    Background: Backend
        Given que a rota base está OK

    ####### Get All Companies #######
    @focus
    Scenario: [TC-75] - Get All Companies - Pegar todos as Companias cadastrados
        Given que estou na rota "/api/company"
        Then devo receber o código "200"

    ####### Get Company by ID #######
    @focus
    Scenario: [TC-76] - Get Company by ID - Pegar compania com ID existente
        Given que estou na rota Get Company by ID com ID "4"
        Then devo receber o código "200" da rota company

    @focus
    Scenario: [TC-77] - Get Company by ID - Pegar compania com ID inexistente
        Given que estou na rota Get Company by ID com ID "0"
        Then devo receber o código "400" da rota company

    @focus
    Scenario: [TC-78] - Get Company by ID -Pegar compania com ID inválido
        Given que estou na rota Get Company by ID com ID "?id"
        Then devo receber o código "500" da rota company

    ####### Create Company #######
    @focus
    Scenario: [TC-79] - Create Company - Criar compania com todos os dados obrigatórios
        Given tenho o objeto da fixture "/company/post/post_201.json" como body do cadastro de Companies
        Then devo receber o código "201" da rota company

    @focus
    Scenario: [TC-80] - Create Company - Criar compania sem todos os dados obrigatórios
        Given tenho o objeto da fixture "/company/post/post_400.json" como body do cadastro de Companies
        Then devo receber o código "400" da rota company

    @focus
    Scenario: [TC-81] - Create Company - Criar compania com dados inválidos no body
        Given tenho o objeto da fixture "/company/post/post_500.json" como body do cadastro de Companies
        Then devo receber o código "500" da rota company

    ####### Update Company #######
    @focus
    Scenario: [TC-82] - Update Company - Atualizar compania com todos os dados obrigatórios e ID válido
        Given que estou na rota Update Company com ID "4"
        And tenho o objeto da fixture "/company/patch/update_200.json" como body da Company de edição
        Then devo receber o código "200" da rota company

    @focus
    Scenario: [TC-83] - Update Company - Atualizar compania com ID inexistente
        Given que estou na rota Update Company com ID "0"
        And tenho o objeto da fixture "/company/patch/update_200.json" como body da Company de edição
        Then devo receber o código "400" da rota company

    @focus
    Scenario: [TC-84] - Update Company - Atualizar compania com ID inválido
        Given que estou na rota Update Company com ID "?id"
        And tenho o objeto da fixture "/company/patch/update_200.json" como body da Company de edição
        Then devo receber o código "500" da rota company

    @focus
    Scenario: [TC-85] - Update Company - Atualizar compania sem todos os dados obrigatórios
        Given que estou na rota Update Company com ID "4"
        And tenho o objeto da fixture "/company/patch/update_400.json" como body da Company de edição
        Then devo receber o código "400" da rota company
    @focus
    Scenario: [TC-86] - Update Company - Atualizar compania com dados inválidos no body
        Given que estou na rota Update Company com ID "4"
        And tenho o objeto da fixture "/company/patch/update_500.json" como body da Company de edição
        Then devo receber o código "500" da rota company

    ####### Delete Company #######
    @focus
    Scenario: [TC-87] - Delete Company - Deletar compania com ID válido
        Given que estou na rota Delete Company com ID "4"
        Then devo receber o código "200" da rota company

    @focus
    Scenario: [TC-88] - Delete Company - Deletar compania com ID inexistente
        Given que estou na rota Delete Company com ID "0"
        Then devo receber o código "400" da rota company

    @focus
    Scenario: [TC-89] - Delete Company - Deletar compania com ID inválido
        Given que estou na rota Delete Company com ID "?id"
        Then devo receber o código "400" da rota company