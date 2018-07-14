#!/bin/bash
DIR="$( dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) )"
DIR_SRC="$DIR/src"
DIR_BIN="$DIR/.bin"
DIR_ARTIFACTS="$DIR/.artifacts"
DIR_ASSETS="$DIR/assets"

function create_directories() {
    mkdir -p "$DIR_BIN" "$DIR_ARTIFACTS" "$DIR_ASSETS"
}

function cleanup_directories() {
    rm -rf "$DIR_BIN" "$DIR_ARTIFACTS"
}