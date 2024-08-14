Feature: Users
    Eu quero realizar a requisição da rota Users e poder receber todos os usuários cadastrados,
    usuários cadastrado por ID, criar usuário, atualizar usuário e deletar usuário.

    Background: Backend
        Given que a rota base está OK

    ####### Get All Users #######

    @focus
    Scenario: [TC-60] - Get All Users - Pegar todos os usuários cadastrados
        Given que estou na rota "/api/user"
        Then devo receber o código "200"


    ####### Get User by ID #######
    @focus
    Scenario: [TC-61] - Get User by ID - Pegar usuário com ID existente
        Given que estou na rota Get User by ID com ID "33"
        Then devo receber o código "200" da rota user
    @focus
    Scenario: [TC-62] - Get User by ID - Pegar usuário com ID inexistente
        Given que estou na rota Get User by ID com ID "0"
        And devo receber o código "400"

    @focus
    Scenario: [TC-63] - Get User by ID - Pegar usuário com ID inválido
        Given que estou na rota Get User by ID com ID "?id"
        Then devo receber o código "500"


    ####### Create User #######
    Scenario: [TC-64] - Create User - Criar usuário com todos os dados obrigatórios
        Given que estou na rota "/api/user/create"
        And tenho o objeto da fixture "/user/post/post_201.json" como body
        Then devo receber os dados do objeto da fixture "user/post_response.json" como resposta
        And devo receber o código "201"

    Scenario: [TC-65] - Create User - Criar usuário sem todos os dados obrigatórios
        Given que estou na rota "/api/user/create"
        And tenho o objeto da fixture "/user/post/post_400.json" como body
        Then devo receber o objeto da fixture "/mensagens/invalidData_400.json" como resposta
        And devo receber o código "400"

    Scenario: [TC-66] - Create User - Criar usuário com dados inválidos no body
        Given que estou na rota "/api/user/create"
        And tenho o objeto da fixture "/user/patch/post_500.json" como body
        Then devo receber o código "500"

    ####### Update User #######
    Scenario: [TC-67] - Update User - Atualizar usuário com todos os dados obrigatórios e ID válido
        Given que estou na rota "/api/user/{id}/update" com ID "60"
        And tenho o objeto da fixture "/user/patch/update_200.json" como body
        Then devo receber os dados do objeto da fixture "user/update_response.json" como resposta
        And devo receber o código "200"

    Scenario: [TC-68] - Update User - Atualizar usuário com ID inexistente
        Given que estou na rota "/api/user/{id}/update" com ID "0"
        And tenho o objeto da fixture "/user/update/update_200.json" como body
        Then devo receber o objeto da fixture "/mensagens/invalidData_400.json" como resposta
        And devo receber o código "400"


    Scenario: [TC-69] - Update User - Atualizar usuário com ID inválido
        Given que estou na rota "/api/user/{id}/update" com ID "?id"
        And tenho o objeto da fixture "/user/update/update_200.json" como body
        Then devo receber o código "400"

    Scenario: [TC-70] - Update User - Atualizar usuário sem todos os dados obrigatórios
        Given que estou na rota "/api/user/{id}/update" com ID "33"
        And tenho o objeto da fixture "user/update/update_400.json" como body
        Then devo receber o objeto da fixture "/mensagens/invalidData_400.json" como resposta
        And devo receber o código "400"

    Scenario: [TC-71] - Update User - Atualizar usuário com dados inválidos no body
        Given que estou na rota "/api/user/{id}/update" com ID "33"
        And tenho o objeto da fixture "user/update/update_500.json" como body
        Then devo receber o código "500"

    ####### Delete User #######
    Scenario: [TC-72] - Delete User - Deletar usuário com ID válido
        Given que estou na rota "/api/user/{id}/delete" com ID "33"
        Then devo receber o objeto da fixture "/mensagens/delete_200.json" como resposta
        And devo receber o código "200"


    Scenario: [TC-73] - Delete User - Deletar usuário com ID inexistente
        Given que estou na rota "/api/user/{id}/delete" com ID "0"
        Then devo receber o objeto da fixture "/mensagens/invalidData_400.json" como resposta
        And devo receber o código "400"

    Scenario: [TC-74] - Delete User - Deletar usuário com ID inválido
        Given que estou na rota "/api/user/{id}/delete" com ID "?id"
        Then devo receber o código "400"
