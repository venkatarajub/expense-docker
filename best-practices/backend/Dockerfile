# use minimal  size images as base OS
FROM node:20 AS builder
# Run with non root acces, for this need to create user and group.
# use CMD instruction
# Combine comands where posible to  reduse the no.of layers
# RUN addgroup -S expense && adduser -S expense -G expense
# RUN mkdir /opt/server
# RUN chown -R expense:expense /opt/server
WORKDIR /opt/server
# frequently changing instruticons should be bottam of the docker file. with this practice we can reduse the  built time and memory  the layers.
COPY package.json .
COPY *.js .
RUN npm install
# multistage building: used to  reduse the memary. It looks like 2 dockerfiles inside 1. 1 is used for duild and copy  the output in 2nd
FROM node:20.18-alpine3.20
EXPOSE 8080
ENV DB_HOST="mysql" 
RUN addgroup -S expense && adduser -S expense -G expense && \
    mkdir /opt/server && \
    chown -R expense:expense /opt/server
WORKDIR /opt/server
COPY --from=builder /opt/server
USER expense
CMD [ "node", "index.js" ]