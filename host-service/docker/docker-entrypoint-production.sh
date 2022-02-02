#!/bin/bash

sudo chown -R docker:users /bundle /node_modules /app/log /app/tmp /app/public

# NOTE KI *NEW* intance clear old trash
if [[ -f /app/tmp/pids/server.pid ]]; then
    rm /app/tmp/pids/server.pid
fi

echo "SERVER_MODE: $SERVER_MODE"

if [[ "$SERVER_MODE" == "debug" ]]; then
    sleep infinity
else
    bundle exec rails s -b 0.0.0.0 -p 3000
fi