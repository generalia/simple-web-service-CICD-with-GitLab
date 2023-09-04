#!/usr/bin/env bash

function init() {
  # useful paths
  readonly script_path="${BASH_SOURCE[0]}"
  readonly script_dir="$(dirname $(readlink -f ${script_path}))"
  readonly repo_dir="${REPO_NAME}-${CI_JOB_ID}"
  readonly tmp_dir=/tmp
  readonly cache_dir=${tmp_dir}/${REPO_NAME}
}

function main() {
  init
}

main $@
