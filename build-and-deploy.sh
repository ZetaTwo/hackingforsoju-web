#!/bin/sh
echo "Building website"
hugo

echo "Uploading files"
cd public
aws s3 cp --recursive . s3://www.hackingforsoju.team

echo "Waiting 5 seconds before clearing cache"
sleep 5

aws cloudfront create-invalidation --distribution-id E2BS46EOS9LJE3 --path '/*'
cd ..

echo "Site published"
