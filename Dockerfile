FROM node:10.19.0-buster
RUN apt-get update
RUN apt-get install -y sudo git nano curl

WORKDIR /opt/
RUN git clone https://github.com/TheRetroMike/node-open-mining-portal

WORKDIR /opt/node-open-mining-portal
RUN npm update
RUN rm -rf pool_configs
RUN rm -rf coins
RUN rm config_example.json

RUN ln -s /opt/config/config.json /opt/node-open-mining-portal/config.json
RUN ln -s /opt/config/pool_configs /opt/node-open-mining-portal/pool_configs
RUN ln -s /opt/config/coins /opt/node-open-mining-portal/coins

RUN apt-get install -y redis-server

CMD service redis-server restart; node init.js
