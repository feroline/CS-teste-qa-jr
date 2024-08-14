require('cypress-signalr-mock');

const { defineConfig } = require('cypress');
const {
	addCucumberPreprocessorPlugin,
} = require('@badeball/cypress-cucumber-preprocessor');
const {
	preprocessor,
} = require('@badeball/cypress-cucumber-preprocessor/browserify');

async function setupNodeEvents(on, config) {
	addCucumberPreprocessorPlugin(on, config);
	on('file:preprocessor', preprocessor(config));

	return config;
}

module.exports = defineConfig({
	env: {
		baseUrlFrontend: 'http://localhost:5400',
		baseUrlBackend: 'http://localhost:8400',
	},
	e2e: {
		specPattern: '**/*.feature',
		setupNodeEvents,
	},
});
