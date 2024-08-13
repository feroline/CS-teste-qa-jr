import { Given, When, Then } from '@badeball/cypress-cucumber-preprocessor';
import { colunaTableTh, linhaTableTr } from '../../locators/homeLocators';

// FIXME: Ao adicionar baseUrl ao config a url não é carregada. A seguinte forma será utilizada temporáriamente, mas não é uma boa prática
const baseUrl = 'http://localhost:5400';

//  ---- GIVEN ----

Given('que acesso a url {string}', (url) => {
	cy.visit(url);
});

Given('que estou na tela inicial', () => {
	cy.url().should('be.equal', `${baseUrl}/`);
});

// TODO: pegar usuários
Given('devo ter os dados dos usuários visíveis na tabela', (dataTable) => {
	let usuarios = dataTable.hashes();

	for (let usuario of usuarios) {
		cy
			.get(linhaTableTr)
			.should('contain', usuario['nome'])
			.and('contain', usuario['email'])
			.and('contain', usuario['telefone'])
			.and('contain', usuario['cidade'])
			.and('contain', usuario['data'])
			.and('contain', usuario['empresas']);
	}
});

Given('que tenho uma tabela de usuários', () => {
	cy.get('table').should('be.visible');
});

//  ---- WHEN ----

When('acesso {string}', (url) => {
	cy.visit(`${baseUrl}${url}`);
});

Then('a url deve conter {string} em seu caminho', (url) => {
	cy.url().should('include', url);
});

//  ---- THEN ----

Then('tenho as colunas a seguir visíveis na tabela', (dataTable) => {
	let colunas = dataTable.raw()[0];
	for (let coluna of colunas) {
		cy.get(colunaTableTh).should('contain', coluna);
	}
});
