/// <reference types="cypress"/>

import { Given, Then, When } from '@badeball/cypress-cucumber-preprocessor';
import {
	deleteUserBtn,
	sweetAlert,
	sweetAlertConfirm,
} from '../../locators/homeLocators';

//  ---- GIVEN ----

Given('que eu tenho o botão de deletar apresentado na listagem', () => {
	cy.get(deleteUserBtn).should('be.visible');
});

//  ---- WHEN ----

When('eu clico no botão deletar do primeiro item da listagem', () => {
	cy.get(deleteUserBtn).first().click();
});

When('clico no botão de confirmar do sweet alert', () => {
	cy.get(sweetAlertConfirm).click();
});

//  ---- THEN ----
Then('o sweet alert fica visível', () => {
	cy.isVisible(true, sweetAlert);
});

Then('o texto {string} é apresentado no sweet alert', (text) => {
	cy.get(sweetAlert).should('contain.text', text);
});

Then('o sweet alert fica invisível', () => {
	cy.isVisible(false, sweetAlert);
});
