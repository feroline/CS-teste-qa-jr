/// <reference types="cypress"/>

import { Given, Then } from '@badeball/cypress-cucumber-preprocessor';
import { useCypressSignalRMock } from 'cypress-signalr-mock';
import { getResponse, setResponse } from './functions';

// FIXME: colocar urls {{baseUrl}}/{{api}}/{{user}} no env
const urlAllUsers = `${Cypress.env('baseUrlBackend')}/api/user`;
const getUserByID = `${Cypress.env('baseUrlBackend')}/api/user/{id}`;

const allUsersConnection =
	useCypressSignalRMock('allUser') ??
	new HubConnectionBuilder().withUrl(urlAllUsers).build();

//FIXME: função não está genérica
Given('tenho os dados da fixture {string} cadastrados', (fixture) => {
	//mocka os dados de acordo com o objeto da fixture

	cy.fixture(fixture).then((obj) => {
		cy.hubPublish('allUser', 'getAllUsers', obj);
		allUsersConnection.on('getAllUsers', (data) => {
			setResponse(data);
		});
	});
});

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

Then('devo receber o código {string} da rota user', (codigo) => {
	cy.validateStatus(getResponse(), Number(codigo));
});
