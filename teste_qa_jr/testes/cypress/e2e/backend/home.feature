Feature: Get dados Home
    Eu quero acessar a rota Home e receber a mensagem correspondente a rota

    Background: Backend
        Given que a rota base está OK

    @focus
    Scenario: [TC-59] - Verificar mensagem da rota
        Given que estou na rota "/"
        Then devo receber o objeto da fixture "/home/get.json" como resposta
        And devo receber o código "200"

