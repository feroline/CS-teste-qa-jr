/// <reference types="cypress"/>

import { Given, When, Then } from '@badeball/cypress-cucumber-preprocessor';
import {
	nameInput,
	emailInput,
	telefoneInput,
	cidadeInput,
	dataInput,
	empresasInput,
	empresasOptionSearchLi,
	submitBtn,
} from '../../locators/formLocators';
import {
	novoUsuarioBtn,
	modalContent,
	closeModal,
} from '../../locators/homeLocators';

//  ---- GIVEN ----

Given('que clico no botão de adicionar usuário', () => {
	cy.get(novoUsuarioBtn).click();
});

Given('que eu tenho o modal de cadastro visível', () => {
	cy.get(novoUsuarioBtn).click();
	cy.isVisible(true, modalContent);
});

Given('preencho os campos com os dados', (dataTable) => {
	let usuario = dataTable.hashes()[0];
	cy.get(nameInput).type(usuario['nome']);
	cy.get(emailInput).type(usuario['email']);
	cy.get(telefoneInput).type(usuario['telefone']);
	cy.get(cidadeInput).type(usuario['cidade']);
	cy.get(dataInput).type(usuario['data']);
	cy.get(empresasInput).type(usuario['empresas']);
	cy.get(empresasOptionSearchLi).click();
});

//  ---- WHEN ----

When('clico no botão fechar modal', () => {
	cy.get(closeModal).click();
});

When('clico no botão Salvar', () => {
	cy.get(submitBtn).click({ force: true });
});

Then('o modal fica visível', () => {
	cy.isVisible(true, modalContent);
});

//  ---- THEN ----

Then('o texto {string} é apresentado', (text) => {
	cy.get(modalContent).should('contain.text', text);
});

Then('o modal fica invisível', () => {
	cy.isVisible(false, modalContent);
});
