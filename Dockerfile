FROM node:0.10
MAINTAINER Jiahao Dai <dyejarhoo@gmail.com>

# Run make generate main.js; not mention in Readme.md
RUN git clone https://github.com/imdjh/weplay-web /srv/weplay-web && \
cd /srv/weplay-web && \
npm install && \
make

RUN git clone https://github.com/imdjh/weplay /srv/weplay && \
cd /srv/weplay && \
npm install && \
npm install forever -g

ADD docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 3001
EXPOSE 3000

CMD ["/entrypoint.sh"]
