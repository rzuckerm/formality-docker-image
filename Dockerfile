FROM node:16.20.2-slim

COPY FORMALITY_* /tmp/
RUN apt-get update && \
    apt-get install -y git && \
    npm install -g formality-js && \
    mkdir -p /opt && \
    cd /opt && \
    git clone https://github.com/moonad/Formality-tmp formality && \
    cd formality && \
    git reset --hard $(cat /tmp/FORMALITY_COMMIT_HASH) && \
    rm -rf $(find -mindepth 1 -maxdepth 1 '!' -name 'src') && \
    apt-get remove -y git && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
