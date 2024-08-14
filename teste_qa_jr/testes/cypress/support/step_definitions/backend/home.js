/// <reference types="cypress"/>

import { Given, Then } from '@badeball/cypress-cucumber-preprocessor';
import { getResponse, setResponse } from './functions';

// FIXME: corrigir linha abaixo adicionando ao arquivo de configuração
const backendBaseUrl = Cypress.env('baseUrlBackend');

Given('que a rota base está OK', () => {
	// Verifica se a rota base está respondendo com 200
	cy.request(backendBaseUrl).its('status').should('be.equal', 200);
});

Given('que estou na rota {string}', (url) => {
	//armazeno a resposta da rota que foi passada
	cy.request(`${backendBaseUrl}${url}`).as('request');
	cy.get('@request').then((response) => {
		setResponse(response);
	});
});

Then('devo receber o objeto da fixture {string} como resposta', (fixture) => {
	// valida resposta da rota de acordo com os dados da fixture
	cy.fixture(fixture).then((obj) => {
		expect(getResponse().body).to.deep.equal(obj);
	});
});

Then('devo receber o código {string}', (codigo) => {
	//valida o status da rota de acordo com o código passado
	expect(getResponse().status).to.equal(Number(codigo));
});
