#!/usr/bin/env bash

## Complete the following steps to get Docker running locally
image_name=chalalaz/ml-microservice
echo $image_name
# Step 1:
# Build image and add a descriptive tag
docker build --tag $image_name -f Dockerfile .

# Step 2: 
# List docker images
docker images

# Step 3: 
# Run flask app
docker run -ti --rm -p 80:80 $image_name
