DIR=`dirname $0`
DIR=`realpath $DIR`
ROOT_DIR=`dirname $DIR`

CONTAINER=$1
SERVER_MODE=debug docker-compose up -d $CONTAINER

shift
docker-compose exec $CONTAINER bash -c "bundle check || bundle install"
docker-compose exec $CONTAINER bash -c "yarn install"
docker-compose exec $CONTAINER bundle exec rails s -b 0.0.0.0 -p 3000
#docker-compose stop $CONTAINER
