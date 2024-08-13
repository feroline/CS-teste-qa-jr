
Feature: Get User by ID
    Eu quero acessar a rota Users e receber os dados do usuário cadastrado por ID

    #TODO: adicionar background e arquivo separado para ser utilizado por todos os cenários
    Background: Backend
        Given rota base é "http://localhost:8400"

    @focus
    Scenario: [TC-61] - Pegar usuário com ID existente
        Given que estou na rota "/api/user/{id}" com ID "33"
        Then devo receber o objeto com "id_user" igual a "33" da fixture "users/allUsers.json"
        And devo receber o código "200"

    Scenario: [TC-62] - Pegar usuário com ID inexistente
        Given que estou na rota "/api/user/{id}" com ID "0"
        Then devo receber o objeto da fixture "mensagens/notFound_404.json" como resposta
        And devo receber o código "404"

    Scenario: [TC-63] - Pegar usuário com ID inválido
        Given que estou na rota "/api/user/{id}" com ID "?id"
        Then devo receber o código "405"

