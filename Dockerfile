FROM node:24.22-alpine AS alpine-node-base
RUN apk --no-cache add curl
ENV TZ="Europe/Warsaw"

FROM alpine-node-base AS development
WORKDIR /app
COPY --chown=node:node package*.json ./
RUN npm ci
COPY --chown=node:node . .
ENTRYPOINT ["./docker/dev/entrypoint"]

FROM alpine-node-base AS build
WORKDIR /app
COPY --chown=node:node package*.json ./
ENV NODE_ENV="production"
RUN npm ci --omit=dev && npm cache clean --force
USER node

FROM alpine-node-base AS production
WORKDIR /app
COPY --chown=node:node docker/prod ./docker/prod
COPY --chown=node:node package.json tsconfig.json ./
COPY --chown=node:node --from=build /app/node_modules ./node_modules
COPY --chown=node:node src ./src
ENTRYPOINT ["./docker/prod/entrypoint"]
