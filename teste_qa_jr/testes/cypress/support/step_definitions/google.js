import { Given, Then } from '@badeball/cypress-cucumber-preprocessor';

const url = 'https://google.com/';

Given('I open Google page', () => {
	cy.visit(url);
});

Then('I see {string} no botão', (texto) => {
	cy.get('.FPdoLc > center > .gNO89b').should('contain.value', texto);
});
