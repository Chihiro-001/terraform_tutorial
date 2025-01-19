# Setup LocalStack

echo "Setup LocalStack"

docker run \
    -d --rm -it \
    -p 127.0.0.1:4566:4566 \
    -p 127.0.0.1:4510-4559:4510-4559 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -e LOCALSTACK_SERVICES="s3,ec2" \
    -e DEBUG=1 \
    -e DOCKER_HOST="unix:///var/run/docker.sock" \
    localstack/localstack
