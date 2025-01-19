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

export AWS_ACCESS_KEY_ID=test
export AWS_SECRET_ACCESS_KEY=test
export AWS_DEFAULT_REGION=ap-northeast-1
