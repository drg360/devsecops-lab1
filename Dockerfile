FROM node:22-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production \
    && npm cache clean --force \
    && rm -rf /usr/local/lib/node_modules/npm /usr/local/bin/npm /usr/local/bin/npx /opt/yarn*
COPY src/ ./src/
USER node
EXPOSE 3000
CMD ["node", "src/index.js"]
