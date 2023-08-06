FROM node:16-alpine as builder

WORKDIR /usr/frontend
COPY package.json .
RUN npm install

COPY . .

RUN npm run build

FROM nginx

COPY --from=builder /usr/frontend/dist /usr/share/nginx/html