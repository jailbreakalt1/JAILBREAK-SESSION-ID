# Use a maintained base image
FROM node:lts-bullseye

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    ffmpeg \
    imagemagick \
    webp && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /usr/src/app

# Copy package metadata
COPY package.json .

# Install Node.js dependencies
RUN npm install && npm install -g qrcode-terminal pm2

# Copy app source code
COPY . .

# Expose desired port
EXPOSE 5000

# Start the app
CMD ["npm", "start"]
