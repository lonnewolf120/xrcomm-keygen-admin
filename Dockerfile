# XRComm GRPC License Admin - Production Docker Image
FROM node:22-alpine

WORKDIR /app

# Install system dependencies
RUN apk add --no-cache tini

# Copy package files
COPY package*.json ./

# Install production dependencies only
RUN npm ci --only=production && npm cache clean --force

# Copy application code
COPY src ./src
COPY views ./views
COPY public ./public
COPY tailwind.config.js .

# Build CSS
RUN npm run build

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD node -e "require('http').get('http://localhost:' + (process.env.PORT || 9000), (r) => {if (r.statusCode !== 200) throw new Error(r.statusCode)})"

# Use tini to handle signals properly
ENTRYPOINT ["/sbin/tini", "--"]

# Run the application
EXPOSE 9000
CMD ["node", "src/index.js"]
