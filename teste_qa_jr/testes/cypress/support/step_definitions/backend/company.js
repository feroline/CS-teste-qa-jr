/// <reference types="cypress"/>

import { Given, Then } from '@badeball/cypress-cucumber-preprocessor';

import {
    getResponse,
    setResponse,
    getObjectID,
    setObjectID,
} from './functions';

// TODO: colocar urls {{baseUrl}}/{{api}}/{{company}} no env
// TODO: Adicionar mock

// api/company está sendo validado em uma função mais genérica
const getCompanyByID = `${Cypress.env('baseUrlBackend')}/api/company/{id}`;
const createCompany = `${Cypress.env('baseUrlBackend')}/api/company/create`;
const updateCompany = `${Cypress.env(
    'baseUrlBackend'
)}/api/company/{id}/update`;
const deleteCompany = `${Cypress.env('baseUrlBackend')}/api/company/{id}/delete`;

Given('que estou na rota Get Company by ID com ID {string}', (id) => {
    let mountRoute = getCompanyByID.replace('{id}', id);
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
    'tenho o objeto da fixture {string} como body do cadastro de Companies',
    (fixture) => {
        cy.fixture(fixture).then((dados) => {
            cy
                .request({
                    method: 'POST',
                    url: createCompany,
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

Given('que estou na rota Update Company com ID {string}', (id) => {
    setObjectID(id);
});

Given('tenho o objeto da fixture {string} como body da Company de edição',
    (fixture) => {
        // TODO: Refatorar : criar funções de mountRoute e request by PATH, READ, CREATE, DELETE;
        // ex.: setResponse(patchRequest(mountRoute,body):response);

        let mountRoute = updateCompany.replace('{id}', getObjectID());

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

Given('que estou na rota Delete Company com ID {string}', (id) => {
	let mountRoute = deleteCompany.replace('{id}', id);
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

Then('devo receber o código {string} da rota company', (codigo) => {
    cy.validateStatus(getResponse(), Number(codigo));
});
