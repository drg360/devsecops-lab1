FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production && npm install -g npm@latest && npm cache clean --force
COPY src/ ./src/
USER node
EXPOSE 3000
CMD ["node", "src/index.js"]
