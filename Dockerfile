# stage 1 2
FROM node:12.18.1
ENV NODE_ENV=production
WORKDIR /app
COPY . .
RUN npm install --production
COPY . .
CMD [ "node", "server.js" ]

# stage 2
FROM nginx:alpine
COPY --from=angular-built /usr/src/app/dist /usr/share/nginx/html