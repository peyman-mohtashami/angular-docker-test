# stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod --env=prod --build-optimizer

# stage 2
FROM nginx:alpine
COPY --from=node /app/dist/angular-docker-test /usr/share/nginx/html
