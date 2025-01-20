# Use the official Node.js image
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json yarn.lock ./
RUN yarn install

# Copy the rest of the application files
COPY . .

# Build the Next.js application
RUN yarn build

# Expose the port Next.js will run on
EXPOSE 3000

# Run the application
CMD ["yarn", "start"]