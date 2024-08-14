// Import commands.js using ES2015 syntax:
import './commands';

Cypress.on('uncaught:exception', (err, runnable) => {
	// retorna falso no caso de erros falsos-positivo
	return false;
});
