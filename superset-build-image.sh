export $(grep -v '^#' .env | xargs)
docker buildx build --build-arg TAG=$SUPERSET_TAG -t custom-superset:$SUPERSET_TAG -f ./superset/Dockerfile ./superset