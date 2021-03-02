#!/bin/bash
echo 'Let`s start'
aws s3api create-bucket --bucket test-jennysiq --region us-east-1 --acl public-read
aws s3 cp ~/site/jobboard2/ s3://test-jennysiq --recursive 
aws s3 website s3://test-jennysiq/ --index-document index.html
aws s3api put-bucket-policy --bucket test-jennysiq --policy file://bp.json
echo 'The Bucket created, with all required permissions, master!'
