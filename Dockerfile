FROM dhi/node:22-alpine3.23-dev AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

RUN npm audit --audit-level=high || true
RUN npm audit fix --omit=dev || true

COPY src ./src
COPY views ./views
COPY public ./public
COPY tailwind.config.js ./tailwind.config.js
RUN npm run build

FROM dhi/node:22-alpine3.23 AS runtime

WORKDIR /app

COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/src ./src
COPY --from=builder /app/views ./views
COPY --from=builder /app/public ./public
COPY --from=builder /app/tailwind.config.js ./tailwind.config.js

ENV NODE_ENV=production
ENV SESSIONS_DIR=/tmp/.sessions
EXPOSE 9000

CMD ["node", "src/index.js"]
