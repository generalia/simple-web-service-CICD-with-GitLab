#!/usr/bin/env bash

for i in ${ENVIRONMENTS}; do
  export $(env | grep "^${i}__" | sed "s/${i}__//g")
  export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
  export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
  export AWS_REGION=${AWS_DEFAULT_REGION}
  export AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}

  imageName=${SERVICE_NAME}:${VERSION}
  imageTag=${ECR_URI}/${SERVICE_NAME}:${VERSION}
  imageRepo=${ECR_URI}/${SERVICE_NAME}

  $(aws ecr get-login --no-include-email)
  
  docker tag ${imageName} ${imageTag}
  docker push ${imageTag}
  
done
