FROM ubuntu:16.04

RUN apt-get update && apt-get -y install curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get install -y nodejs

WORKDIR /app
COPY . .

RUN npm install

ENV API_URL=http://localhost:8000

EXPOSE 5000
CMD npm start
