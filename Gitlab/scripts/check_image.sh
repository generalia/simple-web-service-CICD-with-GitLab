#!/usr/bin/env bash

for i in ${ENVIRONMENTS}; do
  export $(env | grep "^${i}__" | sed "s/${i}__//g")
  export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
  export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
  export AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}

  aws ecr describe-images --repository-name=${SERVICE_NAME} --image-ids imageTag=${VERSION}
done
