# uplyft-case-study
Cloud Engineering Case Study - LocalStack Lambda
# Uplyft Case Study: Cloud Engineering

## Overview

This is a case study for Uplyft AI, which involves setting up LocalStack to simulate AWS services and performing various tasks like S3 bucket creation, Lambda function creation, and invoking them using AWS CLI.

## Steps Followed

Start LocalStack.
Configure AWS CLI (only if you haven't configured it already).
Create an S3 bucket.
Upload a file to the S3 bucket.
Create a Lambda function.
Invoke the Lambda function.
Optionally, delete the uploaded file from the S3 bucket and remove the bucket itself.



### 1. AWS CLI Configuration

In this step, we configured AWS CLI to work with LocalStack instead of the actual AWS Cloud. 

**Command:**
```bash
aws configure


S Access Key ID: test
AWS Secret Access Key: test
Default region name: us-east-1
Default output format: json
This configuration allows you to interact with the AWS-like services running on your local machine using LocalStack.

2. Create an S3 Bucket in LocalStack
Next, we created an S3 bucket to simulate AWS S3 operations.

Command:
aws s3 mb s3://my-local-bucket --endpoint-url=http://localhost:4566
This command creates a new S3 bucket named my-local-bucket in LocalStack.

3. Upload File to S3
After creating the bucket, we uploaded a file to it.

Command:
echo "Hello, LocalStack!" > sample.txt
aws s3 cp sample.txt s3://my-local-bucket/ --endpoint-url=http://localhost:4566
This command uploads the file sample.txt with the content "Hello, LocalStack!" to the S3 bucket.

4. List Files in S3 Bucket
We then listed the files in the S3 bucket to verify the uploaded file.

Command:
aws s3 ls s3://my-local-bucket/ --endpoint-url=http://localhost:4566
This command lists all the objects in the my-local-bucket bucket in LocalStack.

5. Lambda Function Creation and Invocation
We created a Lambda function using LocalStack, uploaded the Lambda code, and invoked it to check if it executed properly.

Step 1: Create Lambda Function

Command:
aws lambda create-function --function-name my-local-lambda \
--runtime python3.8 --role arn:aws:iam::000000000000:role/lambda-role \
--handler lambda_function.lambda_handler --zip-file fileb://function.zip \
--endpoint-url=http://localhost:4566
This command creates a Lambda function named my-local-lambda. The function is created using the Python 3.8 runtime, and the handler is defined in the lambda_function.py file. The code is uploaded as a ZIP file named function.zip.

Step 2: Invoke Lambda Function

Command:
aws lambda invoke --function-name my-local-lambda --endpoint-url=http://localhost:4566 output.txt
This command invokes the Lambda function, and the output is saved in the output.txt file.

6. Conclusion
The tasks mentioned above were successfully completed using LocalStack to simulate AWS services locally.
The Lambda function returned the expected output "Hello from Lambda!" when invoked.
The AWS CLI commands were executed on LocalStack, allowing us to simulate and test AWS services without needing a live AWS environment.

Files Included:
lambda_function.py: The Python code for the Lambda function.
function.zip: The zipped Lambda function for LocalStack.


This case study demonstrates how to work with AWS-like services locally using LocalStack, and how to set up, deploy, and invoke Lambda functions
