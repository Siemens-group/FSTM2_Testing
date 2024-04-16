# specify a base image
FROM node:18-alpine

# create the working directory
WORKDIR /usr/app

# copy package.json in to contianer
COPY package.json ./

# install dependencies
RUN npm install

#copy other files
COPY ./ ./

# startup command
CMD [ "npm","start" ]