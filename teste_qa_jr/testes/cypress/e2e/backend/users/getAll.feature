
Feature: Get All Users
    Eu quero acessar a rota Users e receber todos os usuários cadastrados

    #TODO: adicionar background e arquivo separado para ser utilizado por todos os cenários
    Background: Backend
        Given rota base é "http://localhost:8400"

    @focus
    Scenario: [TC-60] - Pegar todos os usuários cadastrados
        Given que estou na rota "/api/user"
        Then devo receber o objeto da fixture "users/allUsers.json" como resposta
        And devo receber o código "200"

