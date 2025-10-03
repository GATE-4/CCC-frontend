# Use the official Node.js image as the base image
FROM node:18

# Set the working directory inside the container
WORKDIR /usr/src/app

# Default API address (embedded at build-time; overrideable at build/run)
ENV API_ADDRESS=https://three-3-data-backend-118810105777.europe-north2.run.app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the Remix app
RUN npm run build

# Expose the port the app runs on
EXPOSE 3000

# Start the Remix app
CMD ["npm", "start"]