#FROM node:10.13-alpine
#ENV NODE_ENV production
#WORKDIR /usr/src/app


#COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
#RUN npm install
# RUN npm install --production --silent && mv node_modules ../
#COPY package.json /app/package.json
#RUN npm install
#RUN npm install -g @angular/cli@7.3.9

#COPY . .
#EXPOSE 3001
#CMD npm start


# stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# stage 2
FROM nginx:alpine
COPY --from=node /app/dist/angularfirstapp /usr/share/nginx/html