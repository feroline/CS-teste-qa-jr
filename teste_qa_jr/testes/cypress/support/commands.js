/// <reference types="cypress"/>

Cypress.Commands.add('isVisible', (visible, locator) => {
	visible
		? cy.get(locator).should('exist').and('be.visible')
		: cy.get(locator).should('not.exist');
});

Cypress.Commands.add('validateStatus', (response, status) => {
	expect(response.status).to.equal(status);
});
