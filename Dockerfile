FROM node:8.12.0-alpine

ENV PORT=3000

WORKDIR /usr/app

COPY . /usr/app

EXPOSE 3000


RUN apk add --no-cache gcc make g++ python && \
    npm install --s --q --no-optional && \
    npm run test && \
    apk del gcc make g++ python

ENTRYPOINT ["node", "src"]