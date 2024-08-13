
Feature: Get dados Home
    Eu quero acessar a rota Home e receber a mensagem correspondente a rota

    #TODO: adicionar background e arquivo separado para ser utilizado por todos os cenários
    Background: Backend
        Given rota base é "http://localhost:8400"

    @focus
    Scenario: [TC-59] - Verificar mensagem da rota
        Given que estou na rota "/"
        Then devo receber o objeto da fixture "home/get.json" como resposta
        And devo receber o código "200"

