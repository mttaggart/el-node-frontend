FROM node:10 AS base
COPY ./src /frontend

WORKDIR /frontend
RUN npm install

FROM node:10-alpine
COPY --from=base /frontend /frontend
ARG PORT=9001
ARG DATABASE_HOST=node_backend
ARG DATABSE_PORT=9000
ENV PORT $PORT
ENV DATABASE_HOST $DATABASE_HOST
ENV DATABASE_PORT $DATABASE_PORT
EXPOSE $PORT
WORKDIR /frontend

CMD node index.js
