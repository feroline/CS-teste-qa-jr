
Feature: Delete User
    Eu quero acessar a rota Users e poder deletar usuário pelo ID

    #TODO: adicionar background e arquivo separado para ser utilizado por todos os cenários
    Background: Backend
        Given que a rota base está OK

    @focus
    Scenario: [TC-72] - Deletar usuário com ID válido
        Given que estou na rota "/api/user/{id}/delete" com ID "70"
        Then devo receber o objeto da fixture "mensagens/delete_200.json" como resposta
        And devo receber o código "200"


    Scenario: [TC-73] - Deletar usuário com ID inexistente
        Given que estou na rota "/api/user/{id}/delete" com ID "0"
        Then devo receber o objeto da fixture "mensagens/invalidData_400.json" como resposta
        And devo receber o código "400"

    Scenario: [TC-74] -  Deletar usuário com ID inválido
        Given que estou na rota "/api/user/{id}/delete" com ID "?id"
        Then devo receber o código "405"
