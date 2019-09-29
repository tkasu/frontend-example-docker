FROM ubuntu:16.04

RUN apt-get update && apt-get -y install curl git
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get install -y nodejs

RUN git clone https://github.com/tkasu/frontend-example-docker.git app 
WORKDIR /app

RUN npm install

ENV API_URL=http://localhost:8000

EXPOSE 5000
CMD npm start
