# Stage 1: Build Stage
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Salin file package.json dan yarn.lock
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install

# Salin seluruh proyek ke dalam container
COPY . .

# Build aplikasi Next.js
RUN yarn build

# Stage 2: Production Stage
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Salin hanya file yang dibutuhkan dari build stage
COPY --from=builder /app/.next /app/.next
COPY --from=builder /app/public /app/public
COPY --from=builder /app/package.json /app/package.json
COPY --from=builder /app/yarn.lock /app/yarn.lock

# Install dependencies di production
RUN yarn install --production

# Ekspos port untuk aplikasi
EXPOSE 3000

# Jalankan aplikasi
CMD ["yarn", "start"]
