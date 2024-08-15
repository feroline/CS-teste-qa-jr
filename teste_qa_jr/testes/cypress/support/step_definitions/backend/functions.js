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

// TODO: implementar função a seguir nos cenários necessários
export const mountRouteByID = (rota, id) => {
	return rota.replace('{id}', id);
}
