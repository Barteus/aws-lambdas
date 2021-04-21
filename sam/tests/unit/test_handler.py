import os

import boto3
import pytest
from moto import mock_s3

from code.handle import lambda_handler


@pytest.fixture(scope='function')
def aws_credentials():
    """Mocked AWS Credentials for moto."""
    os.environ['AWS_ACCESS_KEY_ID'] = 'testing'
    os.environ['AWS_SECRET_ACCESS_KEY'] = 'testing'
    os.environ['AWS_SECURITY_TOKEN'] = 'testing'
    os.environ['AWS_SESSION_TOKEN'] = 'testing'


@pytest.fixture(scope='function')
def s3(aws_credentials):
    with mock_s3():
        yield boto3.client('s3', region_name='us-east-1')


@pytest.fixture()
def event():
    return {
        "Records": [
            {
                "eventVersion": "2.0",
                "eventSource": "aws:s3",
                "awsRegion": "eu-central-1",
                "eventTime": "1970-01-01T00:00:00.000Z",
                "eventName": "ObjectCreated:Put",
                "s3": {
                    "s3SchemaVersion": "1.0",
                    "configurationId": "testConfigRule",
                    "bucket": {
                        "name": "test-bucket",
                        "arn": "arn:aws:s3:::test-bucket"
                    },
                    "object": {
                        "key": "sample.json"
                    }
                }
            }
        ]
    }


@mock_s3
def test_lambda_handler(s3, event):
    s3.create_bucket(Bucket='test-bucket')
    s3.put_object(Bucket='test-bucket', Body=b'', Key='sample.json', Metadata={'super': 'meta'})

    result = lambda_handler(event, "")

    assert result == {'bucket': 'test-bucket', 'key': 'sample.json', 'metadata': {'super': 'meta'}}
