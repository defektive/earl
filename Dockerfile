# docker build -t earl .
# docker run --rm -it -v `pwd`/test/watchlist:/usr/local/app/watchlist -e "$(head -n 1 .env)" earl
# make sure you add your slack url to the top of the .env file `SLACK_URL=https://hooks.slack.com/services/...`
FROM alpine:latest
RUN apk add --no-cache bash curl openssl dumb-init \
  && mkdir -p /usr/local/app/cache \
  && touch /usr/local/app/watchlist

COPY bin/earl contrib/slack_bot_processor.sh /usr/local/app/

ENTRYPOINT [ "/usr/bin/dumb-init" ]
# /usr/local/app/earl -w /usr/local/app/watchlist -d /usr/local/app/cache -c /usr/local/app/slack_bot_processor.sh -i 5
CMD [ "/usr/local/app/earl", "-w", "/usr/local/app/watchlist", "-d", "/usr/local/app/cache", "-c", "/usr/local/app/slack_bot_processor.sh" ]
