# Base image n8n chính thức (Node + n8n installed)
FROM n8nio/n8n:latest

# Chuyển sang root để copy source
USER root

# Copy source repo (nếu có workflow/custom node)
COPY . /home/node/

WORKDIR /home/node

# Set quyền cho node user
RUN chown -R node:node /home/node

# Chuyển sang node user
USER node

# Expose port n8n
EXPOSE 5678

# ENV config n8n (tất cả config trong Dockerfile)
ENV GENERIC_TIMEZONE="Asia/Ho_Chi_Minh" \
    N8N_BASIC_AUTH_USER="thanhnhut2506" \
    N8N_BASIC_AUTH_PASSWORD="iOrjPq0AQroKDd0qgo115h8dHw19X7iV" \
    N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS="false" \
    N8N_HOST="0.0.0.0" \
    N8N_PORT="5678" \
    N8N_PROTOCOL="https" \
    WEBHOOK_URL="https://n8n-4yzg.onrender.com" \
    DB_TYPE="postgresdb" \
    DB_POSTGRESDB_URL="postgresql://thanhnhut2506:iOrjPq0AQroKDd0qgo115h8dHw19X7iV@dpg-d49n8f49c44c739gnjv0-a.singapore-postgres.render.com:5432/n8ndb_djk2?sslmode=require" \
    PATH="/home/node/.n8n/node_modules/.bin:$PATH"

# Start n8n
CMD ["n8n", "start"]
