DIR=`dirname $0`
DIR=`realpath $DIR`
ROOT_DIR=`dirname $DIR`

PROJECTS_DIR="$ROOT_DIR/projects"

REPOSITORIES="host"
echo "REPOSITORIES: $REPOSITORIES"

echo "$REPOSITORIES" | tr ' ' '\n' | while read REPO; do
    REPO_DIR="$PROJECTS_DIR/${REPO}"
    SERVICE_DIR="$ROOT_DIR/${REPO}-service"

    if [[ ! -d $REPO_DIR ]]; then
        echo "CLONE: $REPO"
        REPO_URL="git@github.com:kikonen/${REPO}.git"
        $(cd $PROJECTS_DIR && git clone $REPO_URL)
    else
        echo "EXIST: $REPO"
    fi

    cp -a $SERVICE_DIR/* $REPO_DIR
    cp -a $SERVICE_DIR/.dockerignore $REPO_DIR
done

ls -al $PROJECTS_DIR
