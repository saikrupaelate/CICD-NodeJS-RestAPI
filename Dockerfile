# Use the official Node.js image as the base image
FROM node:16

# Set environment variables
ENV NODE_ENV=production
ENV PORT=3000

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the application code
COPY . .

# Build the application (if needed)
RUN npm run build

# Expose the application port
EXPOSE ${PORT}

# Start the application
CMD ["npm", "start"]
