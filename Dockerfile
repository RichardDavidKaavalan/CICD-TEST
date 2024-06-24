#Step 1 
FROM node:alphine3.18 as build
WORKDIR /app
COPY package.json .
RUN yarn install
COPY . .
Run yarn build

#step 2
FROM nginx:1.23-alphine
WORKDIR /usr/share/nginx/html
RUN rm -rf *
COPY --from=build /app/build .
EXPOSE 80
ENTRYPOINT [ "nginx", "-g", "daemon oof;" ]