/// <reference types="cypress"/>

import { Given, Then } from '@badeball/cypress-cucumber-preprocessor';

import {
	getResponse,
	setResponse,
	getObjectID,
	setObjectID,
} from './functions';

// TODO: colocar urls {{baseUrl}}/{{api}}/{{user}} no env
// TODO: Adicionar mock

// api/user está sendo validado em uma função mais genérica
const getUserByID = `${Cypress.env('baseUrlBackend')}/api/user/{id}`;
const createUser = `${Cypress.env('baseUrlBackend')}/api/user/create`;
const updateUser = `${Cypress.env('baseUrlBackend')}/api/user/{id}/update`;
const deleteUser = `${Cypress.env('baseUrlBackend')}/api/user/{id}/delete`;

Given('que estou na rota Get User by ID com ID {string}', (id) => {
	let mountRoute = getUserByID.replace('{id}', id);
	cy
		.request({
			method: 'GET',
			url: mountRoute,
			failOnStatusCode: false,
		})
		.as('request');

	cy.get('@request').then((response) => {
		setResponse(response);
	});
});

Given(
	'tenho o objeto da fixture {string} como body do cadastro de usuário',
	(fixture) => {
		cy.fixture(fixture).then((dados) => {
			cy
				.request({
					method: 'POST',
					url: createUser,
					failOnStatusCode: false,
					body: dados,
				})
				.as('request');

			cy.get('@request').then((response) => {
				setResponse(response);
			});
		});
	}
);

Given('que estou na rota Update User com ID {string}', (id) => {
	setObjectID(id);
});

Given(
	'tenho o objeto da fixture {string} como body do usuário de edição',
	(fixture) => {
		let mountRoute = updateUser.replace('{id}', getObjectID());

		cy.fixture(fixture).then((dados) => {
			cy
				.request({
					method: 'PATCH',
					url: mountRoute,
					failOnStatusCode: false,
					body: dados,
				})
				.as('request');

			cy.get('@request').then((response) => {
				setResponse(response);
			});
		});
	}
);

Given('que estou na rota Delete User com ID {string}', (id) => {
	let mountRoute = deleteUser.replace('{id}', id);
	cy
		.request({
			method: 'DELETE',
			url: mountRoute,
			failOnStatusCode: false,
		})
		.as('request');

	cy.get('@request').then((response) => {
		setResponse(response);
	});
});

Then('devo receber o código {string} da rota user', (codigo) => {
	cy.validateStatus(getResponse(), Number(codigo));
});
