import {
	DataTable,
	Given,
	Then,
} from '@badeball/cypress-cucumber-preprocessor';

Given('que acesso a url {string}', (url) => {
	cy.visit(url);
});

// Scenario: [TC-O1] - Verificar URL
Given('que estou na tela inicial Home', () => {});
Then('a url deve conter {string} em seu caminho', (url) => {});

// Scenario: [TC-04] - Verificar tabela com múltiplos usuários
Given('que os seguintes usuários estão cadastrados:', (DataTable) => {
	console.log(DataTable);
});
Then('devo ter os dados dos usuários visíveis na tabela', (data) => {
	console.log(data);
});
