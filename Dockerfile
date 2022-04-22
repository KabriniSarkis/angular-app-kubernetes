# stage 1 2
# stage 1 2
FROM node:latest as node
WORKDIR /app
COPY node_modules/ ./
RUN npm install
RUN npm run build --prod

# stage 2
FROM nginx:alpine
COPY --from=node /usr/local/app/dist/sample-angular-app /usr/share/nginx/html