#!/bin/bash
set -euo pipefail
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
DIR_ROOT="$( dirname "${DIR}" )"

#terraform import gitlab_project.example richardc/example

REPOSITORIES="$@"
TEMPLATE_FILE="${DIR}/templates/repository.tf"
TEMP_DIR="${DIR}/tmp"

counter=0
rm -rf "${TEMP_DIR}"
mkdir -p "${TEMP_DIR}"
while IFS= read -r repo; do
    echo "The repository: ${counter} | $repo"
    counter=$((counter+1))

    nameRepo=`echo $repo | tr / _`
    git clone git@github.com:${repo}.git "${TEMP_DIR}/${counter}"
    
    export GIT_NAME=`cat "${TEMP_DIR}/${counter}/.repository/index.json" | jq -r '.slug'`
    export GIT_TOPICS=`cat "${TEMP_DIR}/${counter}/.repository/index.json" | jq -r '.topics'`

    mkdir -p "${DIR_ROOT}/repository/${counter}"
    envsubst < "${TEMPLATE_FILE}" > "${DIR_ROOT}/repository/${counter}/main.tf"
done < "${DIR}/data/${REPOSITORIES}"