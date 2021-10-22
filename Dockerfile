FROM node:alpine as build_phase
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# /usr/share/nginx/html is from nginx image documentation
# it is where static html should be set
COPY --from=build_phase /app/build /usr/share/nginx/html
