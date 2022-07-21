# Build phase  
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# production server with builded app (ngnix will be automatically start)
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html



