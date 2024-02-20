FROM node:16.20.0-alpine

ENV NODE_ENV=DEV

WORKDIR /code

COPY package.json .

RUN npm install

EXPOSE 9095

COPY . .

CMD ["npm","start"]
