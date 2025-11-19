FROM node:20-bullseye-slim

WORKDIR /home/node

RUN npm install -g n8n

COPY . /home/node/

RUN chown -R node:node /home/node

USER node

EXPOSE 5678

CMD ["n8n", "start"]
