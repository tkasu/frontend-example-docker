FROM ubuntu:16.04

ENV API_URL=http://localhost:8000

WORKDIR /app

RUN apt-get update && apt-get -y \ 
    install curl git && \ 
    curl -sL https://deb.nodesource.com/setup_10.x | bash && \
    apt-get install -y nodejs && \
    git clone https://github.com/tkasu/frontend-example-docker.git . && \
    npm install && \
    apt-get purge -y --auto-remove curl git && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -m app_user && \
    chown -R app_user .

USER app_user

EXPOSE 5000
CMD npm start
