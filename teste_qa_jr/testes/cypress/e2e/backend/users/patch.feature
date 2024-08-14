
Feature: Update User
    Eu quero acessar a rota Users e conseguir atualizar um usuário pelo ID

    #TODO: adicionar background e arquivo separado para ser utilizado por todos os cenários
    Background: Backend
        Given que a rota base está OK

    @focus
    Scenario: [TC-67] - Atualizar usuário com todos os dados obrigatórios e ID válido
        Given que estou na rota "/api/user/{id}/create" com ID "60"
        And tenho o objeto da fixture "user/post/post_201.json" como body
        Then devo receber os dados do objeto da fixture "user/update_response.json" como resposta
        And devo receber o código "201"


    Scenario: [TC-68] - Atualizar usuário com ID inexistente
        Given que estou na rota "/api/user/{id}/create" com ID "0"
        And tenho o objeto da fixture "user/post/post_201.json" como body
        Then devo receber o objeto da fixture "mensagens/invalidData_400.json" como resposta
        And devo receber o código "400"

    Scenario: [TC-69] - Atualizar usuário com ID inválido
        Given que estou na rota "/api/user/{id}/create" com ID "?id"
        And tenho o objeto da fixture "user/post/post_201.json" como body
        Then devo receber o código "405"

    Scenario: [TC-70] - Atualizar usuário sem todos os dados obrigatórios
        Given que estou na rota "/api/user/{id}/create" com ID "60"
        And tenho o objeto da fixture "user/update/update_400.json" como body
        Then devo receber o objeto da fixture "mensagens/invalidData_400.json" como resposta
        And devo receber o código "400"

    Scenario: [TC-71] - Atualizar usuário com dados inválidos no body
        Given que estou na rota "/api/user/{id}/create" com ID "60"
        And tenho o objeto da fixture "user/update/post_500.json" como body
        Then devo receber o código "500"

