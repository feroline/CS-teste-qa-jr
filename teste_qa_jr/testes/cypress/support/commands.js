/// <reference types="cypress"/>

/***
 * Verifica se um elemento existe e está visível na tela com base em seu locator
 * @param {boolean} visible - existencia e visibilidade do elemento
 * @param {string} locator - elemento a ser localizado
 * @example cy.isVisible(true,'#id-elemento')
 */
Cypress.Commands.add('isVisible', (visible, locator) => {
	visible
		? cy.get(locator).should('exist').and('be.visible')
		: cy.get(locator).should('not.exist');
});
