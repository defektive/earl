#! /bin/bash

rm test/watchcache/*
bin/earl \
  -w test/watchlist \
  -d test/watchcache -i 5 \
  -c ./contrib/processors/example_change_processor.sh
