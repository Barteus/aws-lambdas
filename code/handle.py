import boto3

s3 = boto3.resource('s3')


def lambda_handler(event, context):
    print(event)
    for e in event['Records']:
        if e.get("eventName") == "ObjectCreated:Put":
            bucket = e["s3"]["bucket"]["name"]
            key = e["s3"]["object"]["key"]
            obj = s3.Object(bucket, key)
            # additional processing
            return {
                'bucket': bucket,
                'key': key,
                'metadata': obj.metadata
            }
