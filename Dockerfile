FROM node:18-alpine as build-stage

RUN apk add --no-cache git

RUN git clone https://github.com/chris-paganon/vue-tools-ai.git

WORKDIR /vue-tools-ai

RUN npm install
RUN npm run build


FROM build-stage as production-stage

COPY --from=build-stage /vue-tools-ai/.output /vue-tools-ai/.output

WORKDIR /vue-tools-ai/.output/server

CMD ["node", "index.mjs"]