FROM node:18-alpine as build-stage

ARG REPO_URL=https://github.com/chris-paganon/vue-tools-ai.git
ARG REPO_BRANCH=master

RUN apk add --no-cache git

WORKDIR /opt

RUN git clone $REPO_URL

WORKDIR /opt/vue-tools-ai

RUN git fetch origin $REPO_BRANCH
RUN git checkout $REPO_BRANCH
RUN npm install
RUN npm run build


FROM node:18-alpine as production-stage

COPY --from=build-stage /opt/vue-tools-ai/.output /opt/vue-tools-ai/.output

WORKDIR /opt/vue-tools-ai/.output/server

CMD ["node", "index.mjs"]