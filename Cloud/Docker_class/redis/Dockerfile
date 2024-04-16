# specify a base image
FROM alpine

# create the working directory
WORKDIR /usr/app

# Install redis in alpine
RUN apk add --update redis

# start the redis-server
CMD ["redis-server"]
