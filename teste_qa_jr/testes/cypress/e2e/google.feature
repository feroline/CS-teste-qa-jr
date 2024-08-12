Feature: Google Main Page

  I want to open a search engine
  
  @focus
  Scenario: Opening a search engine page
    Given I open Google page
    Then I see "Pesquisa Google" no botão
    