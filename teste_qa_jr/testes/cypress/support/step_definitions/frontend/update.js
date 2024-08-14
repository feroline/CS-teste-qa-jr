/// <reference types="cypress"/>

import { Given, When } from '@badeball/cypress-cucumber-preprocessor';
import { editUserBtn } from '../../locators/homeLocators';

//  ---- GIVEN ----

Given('que eu tenho o botão de editar apresentado na listagem', () => {
	cy.get(editUserBtn).should('be.visible');
});

//  ---- WHEN ----

When('eu clico no botão Editar do primeiro item da listagem', () => {
	cy.get(editUserBtn).first().click();
});
