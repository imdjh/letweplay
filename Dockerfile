FROM node:0.10
MAINTAINER Jiahao Dai <dyejarhoo@gmail.com>


RUN git clone https://github.com/rauchg/weplay-web /srv/weplay-web && \
cd /srv/weplay-web && \
npm install

ADD run.sh /srv/
RUN npm install forever -g && \
    chmod +x /srv/run.sh

EXPOSE 3000

ENTRYPOINT ["/srv/run.sh"]
