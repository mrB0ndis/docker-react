FROM node:15.2.1-alpine3.10 as builder
WORKDIR '/app'
COPY ["package.json", "./"]
RUN npm install
COPY [".", "."]
RUN npm run build

FROM nginx:1.19-alpine
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
