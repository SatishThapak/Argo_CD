# Use the official Node.js 18 image based on Alpine Linux (lightweight and secure)
FROM node:18-alpine3.18

# Create and set the working directory inside the container
WORKDIR /usr/src/app

# Copy only package files first to leverage Docker layer caching
COPY package*.json ./

# Install only production dependencies
RUN npm install --deve

# Copy the rest of the application code
COPY . .

# Add a non-root user for better security
RUN addgroup app && adduser -S -G app app
USER app

# Expose the port your app listens on
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
