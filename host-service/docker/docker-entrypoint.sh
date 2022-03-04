#!/bin/bash

#socat TCP-LISTEN:11211,fork TCP:memcached:11211 &
#socat TCP-LISTEN:6379,fork TCP:redis:6379 &

echo "SERVICE_MODE: $SERVICE_MODE"

if [[ "$SERVICE_MODE" == "debug" ]]; then
    sleep infinity
else
    bundle check || bundle install
    bundle exec rails s -b 0.0.0.0 -p 3000
fi

# TODO KI https://ieftimov.com/post/docker-compose-stray-pids-rails-beyond/
#exec "$@"
