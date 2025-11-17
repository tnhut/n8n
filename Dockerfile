# 1. Base Node.js LTS
FROM node:20-bullseye-slim

# 2. Set working directory
WORKDIR /home/node

# 3. Cài n8n global
RUN npm install -g n8n

# 4. Copy toàn bộ source repo (workflow/custom node)
COPY . /home/node/

# 5. Set quyền cho user node
RUN chown -R node:node /home/node

# 6. Switch sang node user
USER node

# 7. Expose port mặc định n8n
EXPOSE 5678

# 8. ENV config n8n, DB, Auth, webhook
ENV GENERIC_TIMEZONE="Asia/Ho_Chi_Minh" \
    N8N_BASIC_AUTH_USER="thanhnhut2506" \
    N8N_BASIC_AUTH_PASSWORD="iOrjPq0AQroKDd0qgo115h8dHw19X7iV" \
    N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS="false" \
    N8N_HOST="0.0.0.0" \
    N8N_PORT="5678" \
    N8N_PROTOCOL="https" \
    WEBHOOK_URL="https://n8n-4yzg.onrender.com" \
    DB_TYPE="postgresdb" \
    DB_POSTGRESDB_URL="postgresql://thanhnhut2506:iOrjPq0AQroKDd0qgo115h8dHw19X7iV@dpg-d49n8f49c44c739gnjv0-a.singapore-postgres.render.com:5432/n8ndb_djk2?sslmode=require"

# 9. Start n8n
CMD ["n8n", "start"]
