export BUCKET_NAME="my-tf-test-bucket"

aws s3 cp ./index.html s3://$BUCKET_NAME/ \
    --endpoint-url=http://localhost:4566