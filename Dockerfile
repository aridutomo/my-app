# Stage 1: Build Stage
FROM node:18-alpine AS builder

WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install
COPY . .
RUN yarn build

# Stage 2: Production Stage
FROM node:18-alpine

WORKDIR /app
COPY --from=builder /app/.next /app/.next
COPY --from=builder /app/public /app/public
COPY --from=builder /app/package.json /app/package.json
COPY --from=builder /app/yarn.lock /app/yarn.lock

RUN yarn install --production && yarn cache clean

EXPOSE 3000

CMD ["yarn", "start"]
