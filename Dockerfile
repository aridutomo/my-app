# Build Stage
FROM node:18 AS builder
WORKDIR /
COPY ./package.json .
RUN npm install
COPY ./ .
RUN npm run build

# Production Stage
FROM nginx:alpine
COPY --from=builder /.next /usr/share/nginx/html/_next
COPY --from=builder /public /usr/share/nginx/html/static
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
