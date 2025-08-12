# Use lightweight Node image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Install dependencies first (better caching)
COPY package*.json ./
RUN npm ci --omit=dev

# Copy the rest of the code
COPY . .

# Build (only needed for TypeScript projects)
RUN npm run build

# No CMD here — Smithery uses the smithery.yaml startCommand
