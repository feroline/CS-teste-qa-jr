/// <reference types="cypress"/>

import { Given } from '@badeball/cypress-cucumber-preprocessor';
import { useCypressSignalRMock } from 'cypress-signalr-mock';
import { getResponse, setResponse } from './functions';

// FIXME: colocar urls {{baseUrl}}/{{api}}/{{user}} no env
const urlAllUsers = `${Cypress.env('baseUrlFrontend')}/api/user`;

const allUsersConnection =
	useCypressSignalRMock('allUser') ??
	new HubConnectionBuilder().withUrl(urlAllUsers).build();

Given('tenho os dados da fixture {string} cadastrados', (fixture) => {
	//mocka os dados de acordo com o objeto da fixture

	cy.fixture(fixture).then((obj) => {
		cy.hubPublish('allUser', 'getAllUsers', obj);
		allUsersConnection.on('getAllUsers', (data) => {
			setResponse(data);
		});
	});
});

// TODO:Finalizar implementação dos cenários
