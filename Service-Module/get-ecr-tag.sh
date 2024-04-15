#!/bin/bash
# Get repository name
eval "$(jq -r '@sh "REPOSITORY_NAME=\(.repository_name)"')"

{
    IMAGE_TAG=$(aws ecr describe-images --output json --repository-name $REPOSITORY_NAME --filter tagStatus=TAGGED --query 'sort_by(imageDetails,& imagePushedAt)[-1].imageTags[0]' | jq --raw-output 'select(type == "string")')
} || {
    IMAGE_TAG=""
}

jq -n --arg image_tag "$IMAGE_TAG" '{"image_tag":$image_tag}'
