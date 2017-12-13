#! /bin/bash

if [ -z $SLACK_URL ]; then
  echo "no SLACK_URL defined. nothing to do :("
  exit 1
fi

EVENT=$1
URL=$2
DIFF=""

DONE=false
until $DONE ;do
  read || DONE=true
  DIFF="${DIFF}
${REPLY}"
done

slack_post() {
  message=$(sanitize "$1")
  payload='payload={"channel": "#earl-earl-url", "username": "earlbot", "text": "'$message'", "icon_emoji": ":ghost:"}'
  curl -X POST --data-urlencode "$payload" $SLACK_URL
}

sanitize() {
JSON_TOPIC_RAW=$1
JSON_TOPIC_RAW=${JSON_TOPIC_RAW//\\/\\\\} # \
JSON_TOPIC_RAW=${JSON_TOPIC_RAW//\//\\\/} # /
JSON_TOPIC_RAW=${JSON_TOPIC_RAW//\'/\\\'} # ' (not strictly needed ?)
JSON_TOPIC_RAW=${JSON_TOPIC_RAW//\"/\\\"} # "
JSON_TOPIC_RAW=${JSON_TOPIC_RAW//   /\\t} # \t (tab)
JSON_TOPIC_RAW=${JSON_TOPIC_RAW//
/\\\n} # \n (newline)
JSON_TOPIC_RAW=${JSON_TOPIC_RAW//^M/\\\r} # \r (carriage return)
JSON_TOPIC_RAW=${JSON_TOPIC_RAW//^L/\\\f} # \f (form feed)
JSON_TOPIC_RAW=${JSON_TOPIC_RAW//^H/\\\b} # \b (backspace)
echo $JSON_TOPIC_RAW
}

case $EVENT in
  WATCHING)
    slack_post "Now watching $URL"
  ;;
  UPDATED)
    slack_post "$URL has changed! \`\`\` $DIFF \`\`\`"
  ;;
esac
