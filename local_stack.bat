# Start LocalStack
localstack start

# Configure AWS CLI (if not done already)
aws configure

# Create S3 bucket (you can skip this if you already have the bucket)
aws s3 mb s3://my-local-bucket --endpoint-url=http://localhost:4566

# Upload a file to the S3 bucket
echo "Hello, LocalStack!" > sample.txt
aws s3 cp sample.txt s3://my-local-bucket/ --endpoint-url=http://localhost:4566

# Create Lambda function
aws lambda create-function --function-name my-local-lambda --runtime python3.8 --role arn:aws:iam::000000000000:role/lambda-role --handler lambda_function.lambda_handler --zip-file fileb://function.zip --endpoint-url=http://localhost:4566

# Invoke Lambda function (optional)
aws lambda invoke --function-name my-local-lambda --endpoint-url=http://localhost:4566 output.txt

# Optional: Delete the file from the S3 bucket
aws s3 rm s3://my-local-bucket/sample.txt --endpoint-url=http://localhost:4566

# Optional: Delete the S3 bucket after completing the tasks
aws s3 rb s3://my-local-bucket --force --endpoint-url=http://localhost:4566
