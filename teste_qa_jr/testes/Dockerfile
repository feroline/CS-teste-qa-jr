
FROM cypress/included:13.13.2

WORKDIR /testes

COPY ./package.json ./package.json 
COPY ./cypress.config.js ./cypress.config.js 
COPY ./cypress ./cypress
COPY ./node_modules ./node_modules

RUN npm install 

ENV CYPRESS_CONFIG_FILE="cypress.config.js"
# TODO adicionar chave de gravação
# ENV CYPRESS_RECORD_KEY="record_key"

ENTRYPOINT [ "npm", "run", "cy:run" ] 
