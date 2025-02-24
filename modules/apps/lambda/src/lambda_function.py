import json

def lambda_handler(event, context):
    print("The object is uploaded to S3 buckets")
    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }
