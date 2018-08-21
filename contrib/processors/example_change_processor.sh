#! /bin/bash

EVENT=$1
URL=$2
DIFF=""

DONE=false
until $DONE ;do
  read || DONE=true
  DIFF="${DIFF}
${REPLY}"
done

notify() {
  which notify-send && notify-send "$1" || echo $1
}

case $EVENT in
  WATCHING)
    notify "Now watching $URL"
  ;;
  UPDATED)
    notify "$URL has changed! \`\`\` $DIFF \`\`\`"
  ;;
esac
