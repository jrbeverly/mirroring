#!/bin/bash

function get_repository() {
    filename=$(basename $1)
    filename="${filename%.*}"
    echo $filename
}

function mirror_repository() {
    dir="$1"
    
    echo "INFO: Loading definition for repository at $dir/REPO"
    source "$dir/REPO"
    
    dir_bin="$DIR_BIN/$NAME"
    mkdir -p "$dir_bin"
    
    echo "INFO: Cloning source repository [$NAME @ $SOURCE] into $dir_bin"
    git clone "ssh://$SOURCE" "$dir_bin"

    for mirror in "$dir"/*.config
    do
        if [ ! -f "$mirror" ] ; then
            continue;
        fi

        echo "INFO: Loading mirror config from [$mirror]"
        source "$mirror"

        echo "INFO: Preparing to mirror to [$MIRROR_NAME @ $MIRROR_SSH]"        
        (
            cd $dir_bin
            git remote add $MIRROR_NAME $MIRROR_SSH
            git push --prune --force $MIRROR_NAME master
        )
        
    done
}