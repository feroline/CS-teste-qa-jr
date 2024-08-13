
Feature: Create User
    Eu quero acessar a rota Users e conseguir cadastrar um usuário

    #TODO: adicionar background e arquivo separado para ser utilizado por todos os cenários
    Background: Backend
        Given rota base é "http://localhost:8400"

    @focus
    Scenario: [TC-64] - Criar usuário com todos os dados obrigatórios
        Given que estou na rota "/api/user/create"
        And tenho o objeto da fixture "user/post/post_201.json" como body
        Then devo receber os dados do objeto da fixture "user/post_response.json" como resposta
        And devo receber o código "201"

    Scenario: [TC-65] - Criar usuário sem todos os dados obrigatórios
        Given que estou na rota "/api/user/create"
        And tenho o objeto da fixture "user/post/post_400.json" como body
        Then devo receber o objeto da fixture "mensagens/invalidData_400.json" como resposta
        And devo receber o código "400"

    Scenario: [TC-66] - Criar usuário com dados inválidos no body
        Given que estou na rota "/api/user/create"
        And tenho o objeto da fixture "user/post/post_500.json" como body
        Then devo receber o código "500"