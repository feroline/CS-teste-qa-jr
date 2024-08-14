# @ignore-this utilzada para ignorar todos os cenários da feature
Feature: Editar usuário
    Eu quero acessar a tela home e conseguir editar um usuário listado

    # PARTIÇÃO VÁLIDA
    #   TODO: adicionar background a um arquivo geral de features
    Background: Frontend
        Given que acesso a url "http://localhost:5400"

    @focus
    Scenario: [TC-30] - Verificar apresentação e fechamento do modal de Edição
        Given que eu tenho o botão de editar apresentado na listagem
        When que eu tenho o botão de Editar do primeiro item da listagem
        Then o modal fica visível
        And o texto "Editar usuário" é apresentado
        When clico no botão fechar modal
        Then o modal fica invisível

    Scenario: [TC-31] - Verificar apresentação dos dados do usuário na Edição
        Given que eu tenho o botão de editar apresentado na listagem
        When que eu tenho o botão de Editar do primeiro item da listagem
        Then os dados do usuário selecionado devem ser apresentados em seus respectivos campos

    Scenario:[TC-32] - Editar usuário com todos os dados
        Given que eu tenho o modal de edição visível
        And preencho os campos com os dados
            | campo              | dado                    |
            | Email              | email.editado@gmail.com |
            | Telefone           | 65897584995             |
            | Data de nascimento | 23/02/1989              |
            | Empresas           | Empresa 1               |
        When clico no botão "Salvar"
        Then devo ver os dados desse usuário na tela inicial

    Scenario Outline: [TC-33][TC-34][TC-35][TC-36][TC-37][TC-38] - Verificar campos de Edição de usuário
        Given que eu tenho o modal de edição visível
        Then devo ter o input <input> do tipo <inputType>
        And <isRequired> para o atributo required
        Examples:
            | TC | input                | inputType | isRequired |
            | 33 | Nome                 | text      | true       |
            | 34 | E-mail               | email     | true       |
            | 35 | Telefone             | text      | true       |
            | 36 | Cidade de nascimento | text      | false      |
            | 37 | Data de nascimento   | date      | true       |
            | 38 | Empresas             | text      | true       |

    Scenario: [TC-39] - Verificar se a seleção de empresa é apresentada
        Given que eu tenho o modal de edição visível
        When clico no campo "Empresas"
        Then devo ver as empresas cadastradas na listagem
            | empresas  |
            | Empresa 1 |
            | Empresa 2 |
            | Empresa 3 |

    Scenario: [TC-40] - Verificar se a empresa é selecionada e excluída
        Given que eu tenho o modal de edição visível
        When clico no campo "Empresas"
        And seleciono a "Empresa 1"
        Then devo ver "Empresa 1" selecionada
        When clico em "icon_cancel closeIcon"
        Then devo ver que a "Empresa 1" não está mais selecionada

    Scenario: [TC-41] - Verificar botão submit
        Given que eu tenho o modal de edição visível
        Then devo ver o botão "submit" com o texto "Salvar"

    # PARTIÇÃO INVÁLIDA
    Scenario:[TC-42] - Verificar obrigatoriedade do campo Nome
        Given que eu tenho o modal de edição visível
        And preencho os campos com os dados
            | campo              | dado            |
            | Email              | email@gmail.com |
            | Telefone           | 65897584685     |
            | Data de nascimento | 23/02/2001      |
            | Empresas           | Empresa 1       |
        When clico no botão "Salvar"
        Then devo ver a mensagem "Preencha este campo"

    Scenario:[TC-43] - Verificar obrigatoriedade do campo Nome com espaços em branco
        Given que eu tenho o modal de edição visível
        And preencho os campos com os dados
            | campo              | dado            |
            | Nome               |                 |
            | Email              | email@gmail.com |
            | Telefone           | 65897584685     |
            | Data de nascimento | 23/02/2001      |
            | Empresas           | Empresa 1       |
        When clico no botão "Salvar"
        Then devo ver a mensagem "Preencha este campo"

    Scenario:[TC-44] - Verificar obrigatoriedade do campo E-mail
        Given que eu tenho o modal de edição visível
        And preencho os campos com os dados
            | campo              | dado        |
            | Nome               | Maria       |
            | Telefone           | 65897584685 |
            | Data de nascimento | 23/02/2001  |
            | Empresas           | Empresa 1   |
        When clico no botão "Salvar"
        Then devo ver a mensagem "Preencha este campo"

    Scenario:[TC-45] - Verificar obrigatoriedade do campo E-mail com espaços em branco
        Given que eu tenho o modal de edição visível
        And preencho os campos com os dados
            | campo              | dado        |
            | Nome               | Maria       |
            | Email              |             |
            | Telefone           | 65897584685 |
            | Data de nascimento | 23/02/2001  |
            | Empresas           | Empresa 1   |
        When clico no botão "Salvar"
        Then devo ver a mensagem "Preencha este campo"

    Scenario:[TC-46] - Verificar obrigatoriedade do campo Telefone
        Given que eu tenho o modal de edição visível
        And preencho os campos com os dados
            | campo              | dado            |
            | Nome               | Maria           |
            | Email              | email@gmail.com |
            | Data de nascimento | 23/02/2001      |
            | Empresas           | Empresa 1       |
        When clico no botão "Salvar"
        Then devo ver a mensagem "Preencha este campo"

    Scenario:[TC-47] - Verificar obrigatoriedade do campo Telefone com espaços em branco
        Given que eu tenho o modal de edição visível
        And preencho os campos com os dados
            | campo              | dado            |
            | Nome               | Maria           |
            | Email              | email@gmail.com |
            | Telefone           |                 |
            | Data de nascimento | 23/02/2001      |
            | Empresas           | Empresa 1       |
        When clico no botão "Salvar"
        Then devo ver a mensagem "Preencha este campo"

    Scenario:[TC-48] - Verificar obrigatoriedade do campo Data de Nascimento
        Given que eu tenho o modal de edição visível
        And preencho os campos com os dados
            | campo    | dado            |
            | Nome     | Maria           |
            | Email    | email@gmail.com |
            | Telefone | 65897584685     |
            | Empresas | Empresa 1       |
        When clico no botão "Salvar"
        Then devo ver a mensagem "Preencha este campo"

    Scenario:[TC-49] - Verificar obrigatoriedade do campo Empresas
        Given que eu tenho o modal de edição visível
        And preencho os campos com os dados
            | campo              | dado            |
            | Nome               | Maria           |
            | Email              | email@gmail.com |
            | Telefone           | 65897584685     |
            | Data de nascimento | 23/02/2001      |
        When clico no botão "Salvar"
        Then devo ver a mensagem "Preencha este campo"

    Scenario:[TC-50] - Verificar obrigatoriedade do campo Empresas com espaços em branco
        Given que eu tenho o modal de edição visível
        And preencho os campos com os dados
            | campo              | dado            |
            | Nome               | Maria           |
            | Email              | email@gmail.com |
            | Telefone           | 65897584685     |
            | Data de nascimento | 23/02/2001      |
            | Empresas           |                 |
        When clico no botão "Salvar"
        Then devo ver a mensagem "Preencha este campo"

    Scenario Outline: [TC-51] [TC-52] - Inserir datas inválidas em Data de Nascimento
        Given que eu tenho o modal de edição visível
        And preencho o campo "Data de nascimento" com <tipoValorData>
        When clico no botão "Salvar"
        Then devo ver a mensagem "Data inválida"
        Examples:
            | TC | tipoValorData |
            | 51 | futura        |
            | 52 | hoje          |

    Scenario: [TC-53] - Inserir empresa inexistente
        Given que eu tenho o modal de edição visível
        And preencho o campo "Empresas" com "EmpresaInexistente"
        When clico no botão "Salvar"
        Then devo ver a mensagem "Empresa não cadastrada"

    Scenario: [TC-54] - Inserir E-mail com formato inválido
        Given que eu tenho o modal de edição visível
        And preencho o campo "Email" com "emailInválido"
        When clico no botão "Salvar"
        Then devo ver a mensagem "Formato de E-mail inválido"

    Scenario: [TC-55] - Verificar ícone
        Given que eu tenho o botão de editar apresentado na listagem
        Then o ícone deve ser igual a "http://localhost:5400/static/media/edit.c616ad0b.png"

