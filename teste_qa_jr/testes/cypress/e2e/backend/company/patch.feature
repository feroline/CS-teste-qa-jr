
Feature: Update Company
    Eu quero acessar a rota Users e conseguir atualizar um usuário pelo ID

    #TODO: adicionar background e arquivo separado para ser utilizado por todos os cenários
    Background: Backend
        Given rota base é "http://localhost:8400"

    @focus
    Scenario: [TC-82] - Atualizar compania com todos os dados obrigatórios e ID válido
        Given que estou na rota "/api/company/{id}/create" com ID "12"
        And tenho o objeto da fixture "company/post/post_201.json" como body
        Then devo receber os dados do objeto da fixture "company/update_response.json" como resposta
        And devo receber o código "201"


    Scenario: [TC-83] - Atualizar compania com ID inexistente
        Given que estou na rota "/api/company/{id}/create" com ID "0"
        And tenho o objeto da fixture "company/post/post_201.json" como body
        Then devo receber o objeto da fixture "mensagens/invalidData_400.json" como resposta
        And devo receber o código "400"

    Scenario: [TC-84] - Atualizar compania com ID inválido
        Given que estou na rota "/api/company/{id}/create" com ID "?id"
        And tenho o objeto da fixture "company/post/post_201.json" como body
        Then devo receber o código "405"

    Scenario: [TC-85] - Atualizar compania sem todos os dados obrigatórios
        Given que estou na rota "/api/company/{id}/create" com ID "12"
        And tenho o objeto da fixture "company/update/update_400.json" como body
        Then devo receber o objeto da fixture "mensagens/invalidData_400.json" como resposta
        And devo receber o código "400"

    Scenario: [TC-86] - Atualizar compania com dados inválidos no body
        Given que estou na rota "/api/company/{id}/create" com ID "12"
        And tenho o objeto da fixture "company/update/post_500.json" como body
        Then devo receber o código "500"

