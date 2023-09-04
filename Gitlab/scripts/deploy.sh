#!/usr/bin/env bash

# useful paths
readonly orig_cwd="$PWD"
readonly deployment_dir=${orig_cwd}/helm
readonly output_dir=${deployment_dir}/output

rm -rf ${output_dir}
mkdir -p ${output_dir}

for i in ${ENVIRONMENTS}; do

  export $(env | grep "^${i}__" | sed "s/${i}__//g")

  kubeconfig=${i}__KUBECONFIG
  eval cat $(echo \$$kubeconfig) > ${deployment_dir}/kube.$i.cfg
  export KUBECONFIG=${deployment_dir}/kube.$i.cfg
  export IMAGE_TAG=${ECR_URI}/${SERVICE_NAME}:${VERSION}

  # generate helm template
  cat ${deployment_dir}/values.yaml | envsubst > /tmp/values.yaml
  
  helm template ${SERVICE_NAME} . -f /tmp/values.yaml \
    --set timestamp=$(date +%s%N) > ${output_dir}/${i}.yaml

  cat ${output_dir}/${i}.yaml

  helm upgrade --install --atomic --namespace ${K8S_NS} ${SERVICE_NAME} . -f /tmp/values.yaml \
    --set timestamp=$(date +%s%N)

done
