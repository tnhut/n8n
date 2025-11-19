# -----------------------------------------------------
# 1. Base NodeJS image
# -----------------------------------------------------
FROM node:20-bullseye-slim

# -----------------------------------------------------
# 2. Set working directory
# -----------------------------------------------------
WORKDIR /home/node

# -----------------------------------------------------
# 3. Install n8n globally
# -----------------------------------------------------
RUN npm install -g n8n

# -----------------------------------------------------
# 4. Copy project files (optional, for custom nodes)
# -----------------------------------------------------
COPY . /home/node/

# -----------------------------------------------------
# 5. Fix permissions
# -----------------------------------------------------
RUN chown -R node:node /home/node

USER node

# -----------------------------------------------------
# 6. Expose n8n port
# -----------------------------------------------------
EXPOSE 5678

# -----------------------------------------------------
# 7. ENV — FULL CONFIG cho Render (KHÔNG CẦN ADD TRÊN RENDER)
# -----------------------------------------------------
ENV \
  GENERIC_TIMEZONE="Asia/Ho_Chi_Minh" \
  N8N_HOST="0.0.0.0" \
  N8N_PORT="5678" \
  N8N_PROTOCOL="https" \
  WEBHOOK_URL="https://n8n-4yzg.onrender.com" \
  N8N_BASIC_AUTH_USER="thanhnhut2506" \
  N8N_BASIC_AUTH_PASSWORD="iOrjPq0AQroKDd0qgo115h8dHw19X7iV" \
  N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS="false" \
  DB_TYPE="postgresdb" \
  DB_POSTGRESDB_URL="postgresql://thanhnhut2506:iOrjPq0AQroKDd0qgo115h8dHw19X7iV@dpg-d49n8f49c44c739gnjv0-a.singapore-postgres.render.com:5432/n8ndb_djk2?sslmode=require"

# -----------------------------------------------------
# 8. Start n8n
# -----------------------------------------------------
CMD ["n8n", "start"]
