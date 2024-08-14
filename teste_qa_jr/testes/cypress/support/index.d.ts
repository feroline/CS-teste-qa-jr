/// <reference types="cypress" />

declare namespace Cypress {
	interface Chainable<Subject> {
		/***
		 * Verifica se um elemento existe e está visível na tela com base em seu locator
		 * @param {boolean} visible - existencia e visibilidade do elemento
		 * @param {string} locator - elemento a ser localizado
		 * @example cy.isVisible(true,'#id-elemento')
		 */
		isVisible(visible: boolean, locator: string): Chainable<any>;
	}
}
