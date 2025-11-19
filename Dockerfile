FROM node:20-bullseye-slim

WORKDIR /home/node

RUN npm install -g n8n

COPY . /home/node/

RUN chown -R node:node /home/node

USER node

EXPOSE 5678

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
  DB_POSTGRESDB_CONNECTION_STRING="postgresql://thanhnhut2506:iOrjPq0AQroKDd0qgo115h8dHw19X7iV@dpg-d49n8f49c44c739gnjv0-a.singapore-postgres.render.com:5432/n8ndb_djk2?sslmode=require"

CMD ["n8n", "start"]
