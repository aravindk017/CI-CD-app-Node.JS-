# Use Node.js official image as a base
FROM node:16

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json /app
RUN npm install

# Copy the rest of the application code
COPY . /app

# Expose port 3000
EXPOSE 3000

# Start the application
CMD ["node", "index.js"]
