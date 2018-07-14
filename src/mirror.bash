#!/bin/bash
set -e
SOURCE="$( dirname "${BASH_SOURCE[0]}" )"

###########################
# Library imports
###########################
. "$SOURCE/directory.bash"
. "$SOURCE/repository.bash"

##############
# Functions
##############

function setup() {
    echo "INFO: Cleaning up previous directory structure"
    cleanup_directories

    echo "INFO: Creating directory structure"
    create_directories
}

function main() {

    setup

    echo "INFO: Iterating over directory assets"
    for repo in "$DIR_ASSETS"/*
    do
        if [ -d "$repo" ] && [ -f "$repo"/REPO ]; then

            ( mirror_repository $repo )

        fi
    done
}

##############
# Main
##############

main