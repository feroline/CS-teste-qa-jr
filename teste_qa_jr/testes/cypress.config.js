const { defineConfig } = require('cypress');
const {
	addCucumberPreprocessorPlugin,
} = require('@badeball/cypress-cucumber-preprocessor');
const {
	preprocessor,
} = require('@badeball/cypress-cucumber-preprocessor/browserify');

// const { installPlugin } = require('@swimlane/cy-mockapi');

async function setupNodeEvents(on, config) {
	addCucumberPreprocessorPlugin(on, config);
	on('file:preprocessor', preprocessor(config));
	// installPlugin(on, config);

	return config;
}

module.exports = defineConfig({
	e2e: {
		specPattern: '**/*.feature',
		setupNodeEvents,
	},
});
