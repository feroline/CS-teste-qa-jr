
Feature: Get All Companies
    Eu quero acessar a rota company e receber todos as companias cadastrados

    #TODO: adicionar background e arquivo separado para ser utilizado por todos os cenários
    Background: Backend
        Given rota base é "http://localhost:8400"

    @focus
    Scenario: [TC-75] - Pegar todos as Companias cadastrados
        Given que estou na rota "/api/company"
        Then devo receber o objeto da fixture "company/allCompanies.json" como resposta
        And devo receber o código "200"

