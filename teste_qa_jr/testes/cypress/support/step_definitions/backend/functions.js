let requestResponse = {};
let objectID = '';

export const [
	getResponse = () => {
		return requestResponse;
	},
	setResponse = (response) => {
		requestResponse = response;
	},
] = '';

export const [
	getObjectID = () => {
		return objectID;
	},
	setObjectID = (id) => {
		objectID = id;
	},
] = '';
