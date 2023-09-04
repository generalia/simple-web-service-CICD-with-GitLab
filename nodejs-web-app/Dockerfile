# Use an Alpine-based Node.js runtime as the base image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Expose port 3000 for the Node.js application
EXPOSE 3000

# Start the Node.js application at /mynode
CMD ["npm", "start"]