rm -rf layer && mkdir -p layer
docker build -t metpy-builder .
CONTAINER=$(docker run -d metpy-builder false)
docker cp \
    $CONTAINER:/var/task/edr_layer.zip \
    layer/.
docker rm $CONTAINER
