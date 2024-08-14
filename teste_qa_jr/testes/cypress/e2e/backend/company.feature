Feature: Company
    Eu quero realizar a requisição da rota Company e poder receber todos as companias cadastradas,
    companias cadastradas por ID, criar compania, atualizar compania e deletar compania.

    Background: Backend
        Given que a rota base está OK

    ####### Get All Companies #######
    @focus
    Scenario: [TC-75] - Get All Companies - Pegar todos as Companias cadastrados
        Given que estou na rota "/api/company"
        Then devo receber o objeto da fixture "/company/allCompanies.json" como resposta
        And devo receber o código "200"

    ####### Get Company by ID #######
    Scenario: [TC-76] - Get Company by ID - Pegar compania com ID existente
        Given que estou na rota "/api/company/{id}" com ID "3"
        Then devo receber o objeto com "id_company" igual a "3" da fixture "/company/allCompanies.json"
        And devo receber o código "200"

    Scenario: [TC-77] - Get Company by ID - Pegar compania com ID inexistente
        Given que estou na rota "/api/company/{id}" com ID "0"
        Then devo receber o objeto da fixture "/mensagens/notFound_404.json" como resposta
        And devo receber o código "404"

    Scenario: [TC-78] - Get Company by ID -Pegar compania com ID inválido
        Given que estou na rota "/api/company/{id}" com ID "?id"
        Then devo receber o código "405"

    ####### Create Company #######
    Scenario: [TC-79] - Create Company - Criar compania com todos os dados obrigatórios
        Given que estou na rota "/api/company/create"
        And tenho o objeto da fixture "/company/post/post_201.json" como body
        Then devo receber os dados do objeto da fixture "/company/post_response.json" como resposta
        And devo receber o código "201"

    Scenario: [TC-80] - Create Company - Criar compania sem todos os dados obrigatórios
        Given que estou na rota "/api/company/create"
        And tenho o objeto da fixture "/company/post/post_400.json" como body
        Then devo receber o objeto da fixture "/mensagens/invalidData_400.json" como resposta
        And devo receber o código "400"

    Scenario: [TC-81] - Create Company - Criar compania com dados inválidos no body
        Given que estou na rota "/api/company/create"
        And tenho o objeto da fixture "/company/post/post_500.json" como body
        Then devo receber o código "500"

    ####### Update Company #######
    Scenario: [TC-82] - Update Company - Atualizar compania com todos os dados obrigatórios e ID válido
        Given que estou na rota "/api/company/{id}/update" com ID "12"
        And tenho o objeto da fixture "/company/update/update_200.json" como body
        Then devo receber os dados do objeto da fixture "/company/update_response.json" como resposta
        And devo receber o código "200"

    Scenario: [TC-83] - Update Company - Atualizar compania com ID inexistente
        Given que estou na rota "/api/company/{id}/update" com ID "0"
        And tenho o objeto da fixture "/company/update/update_200.json" como body
        Then devo receber o objeto da fixture "/mensagens/invalidData_400.json" como resposta
        And devo receber o código "400"

    Scenario: [TC-84] - Update Company - Atualizar compania com ID inválido
        Given que estou na rota "/api/company/{id}/update" com ID "?id"
        And tenho o objeto da fixture "/company/post/post_201.json" como body
        Then devo receber o código "405"

    Scenario: [TC-85] - Update Company - Atualizar compania sem todos os dados obrigatórios
        Given que estou na rota "/api/company/{id}/update" com ID "12"
        And tenho o objeto da fixture "/company/update/update_400.json" como body
        Then devo receber o objeto da fixture "/mensagens/invalidData_400.json" como resposta
        And devo receber o código "400"

    Scenario: [TC-86] - Update Company - Atualizar compania com dados inválidos no body
        Given que estou na rota "/api/company/{id}/update" com ID "12"
        And tenho o objeto da fixture "/company/update/post_500.json" como body
        Then devo receber o código "500"

    ####### Delete Company #######
    Scenario: [TC-87] - Delete Company - Deletar compania com ID válido
        Given que estou na rota "/api/company/{id}/delete" com ID "12"
        Then devo receber o objeto da fixture "/mensagens/delete_200.json" como resposta
        And devo receber o código "200"

    Scenario: [TC-88] - Delete Company - Deletar compania com ID inexistente
        Given que estou na rota "/api/company/{id}/delete" com ID "0"
        Then devo receber o objeto da fixture "/mensagens/invalidData_400.json" como resposta
        And devo receber o código "400"

    Scenario: [TC-89] - Delete Company - Deletar compania com ID inválido
        Given que estou na rota "/api/company/{id}/delete" com ID "?id"
        Then devo receber o código "400"