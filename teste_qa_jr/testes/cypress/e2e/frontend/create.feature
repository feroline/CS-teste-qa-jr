# @ignore-this utilzada para ignorar todos os cenários da feature
Feature: Criar usuário
  Eu quero acessar a tela home e conseguir criar um usuário

  # PARTIÇÃO VÁLIDA
  #   TODO: adicionar background a um arquivo geral de features
  Background: Frontend
    Given que acesso a url "http://localhost:5400/home"
    Then a url deve conter "/home" em seu caminho

  @focus
  Scenario: [TC-O6] - Verificar apresentação e fechamento do modal de Cadastro
    Given que eu tenho o botão "Novo usuário"
    When clico no botão "Novo usuário"
    Then o modal fica visível
    And o texto "Cadastrar novo usuário" é apresentado
    When clico no botão "react-modal-close"
    Then o modal fica invisível

  Scenario:[TC-07] - Cadastrar usuário com todos os dados
    Given que eu tenho o modal de cadastro visível
    And preencho os campos com os dados
      | campo              | dado            |
      | Nome               | Maria           |
      | Email              | email@gmail.com |
      | Telefone           | 65897584685     |
      | Data de nascimento | 23/02/2001      |
      | Empresas           | Empresa 1       |
    When clico no botão "Salvar"
    Then devo ver os dados desse usuário na tela inicial

  Scenario Outline: [TC-08][TC-09][TC-10][TC-11][TC-12][TC-13] - Verificar campos do cadastro de novo usuário
    Given que eu tenho o modal de cadastro visível
    Then devo ter o input <input> do tipo <inputType>
    And <isRequired> para o atributo required
    Examples:
      | TC | input                | inputType | isRequired |
      | 08 | Nome                 | text      | true       |
      | 09 | E-mail               | email     | true       |
      | 10 | Telefone             | text      | true       |
      | 11 | Cidade de nascimento | text      | false      |
      | 12 | Data de nascimento   | date      | true       |
      | 13 | Empresas             | text      | true       |

  Scenario: [TC-14] - Verificar se a seleção de empresa é apresentada
    Given que eu tenho o modal de cadastro visível
    When clico no campo "Empresas"
    Then devo ver as empresas cadastradas na listagem
      | empresas  |
      | Empresa 1 |
      | Empresa 2 |
      | Empresa 3 |

  Scenario: [TC-15] - Verificar se a empresa é selecionada e excluída
    Given que eu tenho o modal de cadastro visível
    When clico no campo "Empresas"
    And seleciono a "Empresa 1"
    Then devo ver "Empresa 1" selecionada
    When clico em "icon_cancel closeIcon"
    Then devo ver que a "Empresa 1" não está mais selecionada

  Scenario: [TC-16] - Verificar botão submit
    Given que eu tenho o modal de cadastro visível
    Then devo ver o botão "submit" com o texto "Salvar"

  # PARTIÇÃO INVÁLIDA
  Scenario:[TC-17] - Verificar obrigatoriedade do campo Nome
    Given que eu tenho o modal de cadastro visível
    And preencho os campos com os dados
      | campo              | dado            |
      | Email              | email@gmail.com |
      | Telefone           | 65897584685     |
      | Data de nascimento | 23/02/2001      |
      | Empresas           | Empresa 1       |
    When clico no botão "Salvar"
    Then devo ver a mensagem "Preencha este campo"

  Scenario:[TC-18] - Verificar obrigatoriedade do campo Nome com espaços em branco
    Given que eu tenho o modal de cadastro visível
    And preencho os campos com os dados
      | campo              | dado            |
      | Nome               |                 |
      | Email              | email@gmail.com |
      | Telefone           | 65897584685     |
      | Data de nascimento | 23/02/2001      |
      | Empresas           | Empresa 1       |
    When clico no botão "Salvar"
    Then devo ver a mensagem "Preencha este campo"

  Scenario:[TC-19] - Verificar obrigatoriedade do campo E-mail
    Given que eu tenho o modal de cadastro visível
    And preencho os campos com os dados
      | campo              | dado        |
      | Nome               | Maria       |
      | Telefone           | 65897584685 |
      | Data de nascimento | 23/02/2001  |
      | Empresas           | Empresa 1   |
    When clico no botão "Salvar"
    Then devo ver a mensagem "Preencha este campo"

  Scenario:[TC-20] - Verificar obrigatoriedade do campo E-mail com espaços em branco
    Given que eu tenho o modal de cadastro visível
    And preencho os campos com os dados
      | campo              | dado        |
      | Nome               | Maria       |
      | Email              |             |
      | Telefone           | 65897584685 |
      | Data de nascimento | 23/02/2001  |
      | Empresas           | Empresa 1   |
    When clico no botão "Salvar"
    Then devo ver a mensagem "Preencha este campo"

  Scenario:[TC-21] - Verificar obrigatoriedade do campo Telefone
    Given que eu tenho o modal de cadastro visível
    And preencho os campos com os dados
      | campo              | dado            |
      | Nome               | Maria           |
      | Email              | email@gmail.com |
      | Data de nascimento | 23/02/2001      |
      | Empresas           | Empresa 1       |
    When clico no botão "Salvar"
    Then devo ver a mensagem "Preencha este campo"

  Scenario:[TC-22] - Verificar obrigatoriedade do campo Telefone com espaços em branco
    Given que eu tenho o modal de cadastro visível
    And preencho os campos com os dados
      | campo              | dado            |
      | Nome               | Maria           |
      | Email              | email@gmail.com |
      | Telefone           |                 |
      | Data de nascimento | 23/02/2001      |
      | Empresas           | Empresa 1       |
    When clico no botão "Salvar"
    Then devo ver a mensagem "Preencha este campo"

  Scenario:[TC-23] - Verificar obrigatoriedade do campo Data de Nascimento
    Given que eu tenho o modal de cadastro visível
    And preencho os campos com os dados
      | campo    | dado            |
      | Nome     | Maria           |
      | Email    | email@gmail.com |
      | Telefone | 65897584685     |
      | Empresas | Empresa 1       |
    When clico no botão "Salvar"
    Then devo ver a mensagem "Preencha este campo"

  Scenario:[TC-24] - Verificar obrigatoriedade do campo Empresas
    Given que eu tenho o modal de cadastro visível
    And preencho os campos com os dados
      | campo              | dado            |
      | Nome               | Maria           |
      | Email              | email@gmail.com |
      | Telefone           | 65897584685     |
      | Data de nascimento | 23/02/2001      |
    When clico no botão "Salvar"
    Then devo ver a mensagem "Preencha este campo"

  Scenario:[TC-25] - Verificar obrigatoriedade do campo Empresas com espaços em branco
    Given que eu tenho o modal de cadastro visível
    And preencho os campos com os dados
      | campo              | dado            |
      | Nome               | Maria           |
      | Email              | email@gmail.com |
      | Telefone           | 65897584685     |
      | Data de nascimento | 23/02/2001      |
      | Empresas           |                 |
    When clico no botão "Salvar"
    Then devo ver a mensagem "Preencha este campo"

  Scenario Outline: [TC-26] [TC-27] - Inserir datas inválidas em Data de Nascimento
    Given que eu tenho o modal de cadastro visível
    And preencho o campo "Data de nascimento" com <tipoValorData>
    When clico no botão "Salvar"
    Then devo ver a mensagem "Data inválida"
    Examples:
      | TC | tipoValorData |
      | 26 | futura        |
      | 27 | hoje          |

  Scenario: [TC-28] - Inserir empresa inexistente
    Given que eu tenho o modal de cadastro visível
    And preencho o campo "Empresas" com "EmpresaInexistente"
    When clico no botão "Salvar"
    Then devo ver a mensagem "Empresa não cadastrada"

  Scenario: [TC-29] - Inserir E-mail com formato inválido
    Given que eu tenho o modal de cadastro visível
    And preencho o campo "Email" com "emailInválido"
    When clico no botão "Salvar"
    Then devo ver a mensagem "Formato de E-mail inválido"

