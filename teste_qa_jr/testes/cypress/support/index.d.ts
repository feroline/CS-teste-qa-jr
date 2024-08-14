/// <reference types="cypress" />

declare namespace Cypress {
	interface Chainable<Subject> {
		/***
		 * Verifica se um elemento existe e está visível na tela com base em seu locator
		 * @param {boolean} visible - existencia e visibilidade do elemento
		 * @param {string} locator - elemento a ser localizado
		 * @example cy.isVisible(true,'#id-elemento')
		 */
		isVisible(visible: boolean, locator: string): Chainable;
		/***
		 * Valida status da resposta recebida, se ele é igual ao estado esperado
		 * @param {Cypress.RequestBody<Object>} response - resposta recebida
		 * @param {number} status - status esperado
		 * @example validateStatus(getResponse(),200);
		 */
		validateStatus(response: object, status: number): Chainable;
	}
}
