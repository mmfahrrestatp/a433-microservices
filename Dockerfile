FROM node:18-alpine as base

WORKDIR /src

# Copy js files from local to docker image
COPY package*.json ./

# Run clean install
RUN npm ci

# Copy js files from local to docker image
COPY ./*.js ./ 

# Run index.js
CMD ["node", "index.js"] 