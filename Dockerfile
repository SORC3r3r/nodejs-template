FROM node:14-alpine AS build
#FROM node:14-stretch-slim AS build

#RUN apt-get update && \
#    apt-get install -y build-essential python

ARG NPM_TOKEN

WORKDIR ./workspace

COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm install && \
    npm cache clear -f

#RUN apt remove  -y build-essential && \
#    apt remove  -y python

COPY . .

RUN npm run build

FROM node:14-alpine

USER node

WORKDIR ./workspace

COPY --chown=node:node --from=build /workspace /workspace

ENV NODE_ENV production

CMD ["npm", "start"]
