import boto3


def lambda_handler(event, context):
    print(event)
    s3 = boto3.client('s3')
    for e in event['Records']:
        if e.get("eventName") == "ObjectCreated:Put":
            bucket = e["s3"]["bucket"]["name"]
            key = e["s3"]["object"]["key"]
            obj = s3.head_object(Bucket=bucket, Key=key)
            # additional processing
            return {
                'bucket': bucket,
                'key': key,
                'metadata': obj['Metadata']
            }
