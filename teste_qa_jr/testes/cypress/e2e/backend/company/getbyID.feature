
Feature: Get Company by ID
    Eu quero acessar a rota Company e receber os dados da compania cadastrado por ID

    #TODO: adicionar background e arquivo separado para ser utilizado por todos os cenários
    Background: Backend
        Given que a rota base está OK

    @focus
    Scenario: [TC-76] - Pegar compania com ID existente
        Given que estou na rota "/api/company/{id}" com ID "3"
        Then devo receber o objeto com "id_company" igual a "3" da fixture "company/allCompanies.json"
        And devo receber o código "200"

    Scenario: [TC-77] - Pegar compania com ID inexistente
        Given que estou na rota "/api/company/{id}" com ID "0"
        Then devo receber o objeto da fixture "mensagens/notFound_404.json" como resposta
        And devo receber o código "404"

    Scenario: [TC-78] - Pegar compania com ID inválido
        Given que estou na rota "/api/company/{id}" com ID "?id"
        Then devo receber o código "405"

