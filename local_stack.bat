localstack start
aws configure
aws s3 mb s3://my-local-bucket --endpoint-url=http://localhost:4566
echo "Hello, LocalStack!" > sample.txt
aws s3 cp sample.txt s3://my-local-bucket/ --endpoint-url=http://localhost:4566
aws lambda create-function --function-name my-local-lambda --runtime python3.8 --role arn:aws:iam::000000000000:role/lambda-role --handler lambda_function.lambda_handler --zip-file fileb://function.zip --endpoint-url=http://localhost:4566
