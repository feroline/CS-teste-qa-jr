
FROM cypress/included:13.13.2

WORKDIR /testes

COPY ./package.json ./package.json 
COPY ./cypress.config.js ./cypress.config.js 
COPY ./cypress ./cypress
COPY ./node_modules ./node_modules

RUN npm install 

ENV CYPRESS_CONFIG_FILE="cypress.config.js"
# ENV CYPRESS_RECORD_KEY="your_record_key"


# ["executável", "param1", "param2"] 
ENTRYPOINT [ "npm", "run", "cy:run" ] 
