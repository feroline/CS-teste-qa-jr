
Feature: Criar, Ler, Editar e Deletar um usuário.
    Eu quero acessar a tela home e conseguir criar um usuário, ler os dados cadastrados, editar os dados cadastrados e excluir o usuário.
    Realizar um teste de fumaça E2E das principais funcionalidades.
    Esta Feature avalia a persistência dos dados ao cadastrar, editar e excluir e a integração do backend com o frontend


    Background: CRUD
        Given que acesso a url "http://localhost:5400"


    # TODO: adicionar cenário em arquivo externo para não ficar repetindo
    Scenario:[TC-90] - Cadastrar, ler, editar e excluir usuário
        Given que estou na tela inicial
        And que eu tenho o modal de cadastro visível
        When preencho os campos com os dados
            | nome  | email           | telefone    | cidade         | data       | empresas  |
            | Maria | email@gmail.com | 65897584685 | Porto Nacional | 2001-02-23 | Empresa 1 |
        And clico no botão Salvar
        Then devo ter os dados dos usuários visíveis na tabela
            | nome  | email           | telefone    | cidade         | data       | empresas  |
            | Maria | email@gmail.com | 65897584685 | Porto Nacional | 2001-02-23 | Empresa 1 |
