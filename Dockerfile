FROM node:0.10
MAINTAINER Jiahao Dai <dyejarhoo@gmail.com>

# Run make generate main.js; not mention in Readme.md
RUN git clone https://github.com/imdjh/weplay-web /srv/weplay-web && \
cd /srv/weplay-web && \
npm install && \
make

ADD docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 3000

CMD ["/entrypoint.sh"]
