
Feature: Delete Company
    Eu quero acessar a rota Company e poder deletar uma Company pelo ID

    #TODO: adicionar background e arquivo separado para ser utilizado por todos os cenários
    Background: Backend
        Given rota base é "http://localhost:8400"

    @focus
    Scenario: [TC-87] - Deletar compania com ID válido
        Given que estou na rota "/api/company/{id}/delete" com ID "12"
        Then devo receber o objeto da fixture "mensagens/delete_200.json" como resposta
        And devo receber o código "200"


    Scenario: [TC-88] - Deletar compania com ID inexistente
        Given que estou na rota "/api/compania/{id}/delete" com ID "0"
        Then devo receber o objeto da fixture "mensagens/invalidData_400.json" como resposta
        And devo receber o código "400"

    Scenario: [TC-89] -  Deletar compania com ID inválido
        Given que estou na rota "/api/company/{id}/delete" com ID "?id"
        Then devo receber o código "405"
