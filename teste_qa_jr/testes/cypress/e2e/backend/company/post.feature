
Feature: Create Company
    Eu quero acessar a rota Company e conseguir cadastrar uma Company

    #TODO: adicionar background e arquivo separado para ser utilizado por todos os cenários
    Background: Backend
        Given rota base é "http://localhost:8400"

    @focus
    Scenario: [TC-79] - Criar compania com todos os dados obrigatórios
        Given que estou na rota "/api/company/create"
        And tenho o objeto da fixture "company/post/post_201.json" como body
        Then devo receber os dados do objeto da fixture "company/post_response.json" como resposta
        And devo receber o código "201"

    Scenario: [TC-80] - Criar compania sem todos os dados obrigatórios
        Given que estou na rota "/api/company/create"
        And tenho o objeto da fixture "company/post/post_400.json" como body
        Then devo receber o objeto da fixture "mensagens/invalidData_400.json" como resposta
        And devo receber o código "400"

    Scenario: [TC-81] - Criar compania com dados inválidos no body
        Given que estou na rota "/api/company/create"
        And tenho o objeto da fixture "company/post/post_500.json" como body
        Then devo receber o código "500"