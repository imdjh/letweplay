FROM node:0.10
MAINTAINER Jiahao Dai <dyejarhoo@gmail.com>


RUN git clone https://github.com/rauchg/weplay-web /srv/weplay-web && \
cd /srv/weplay-web && \
npm install

COPY run.sh /srv
RUN npm install forever -g && \
    chmod +x /srv/run.sh

ENTRYPOINT ["/srv/run.sh"]
