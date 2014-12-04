#!/bin/bash
# dev.sh

function usage() {
echo "
    To development:
    ./dev.sh

    To watch jade:
    ./dev.sh --watch-jade

    To watch stylus:
    ./dev.sh --watch-stylus

    To run livereload:
    ./dev.sh --livereload

    To run a server:
    ./dev.sh --server
"
}


# Empty arguments
if [[ -z "$1" ]]; then
    usage;
    exit 1;
fi


# Parse arguments
while [[ $# > 0 ]]; do
    key="$1"

    case $key in
        --watch-jade)
            __watch_jade=true
            ;;

        --watch-stylus)
            __watch_stylus=true
            ;;

        --server)
            __server=true
            ;;

        --livereload)
            __livereload=true
            ;;

        -h|--help)
            usage;
            exit 1;
            ;;

        *)
            usage;
            echo "  [error] unknown option:" $key;
            exit 1;
            ;;
    esac

    shift;
done


# Watch Jade
if [[ $__watch_jade ]]; then
    echo "  watch jade"
    jade --watch --pretty --out ./test/ ./test-src/*.jade
fi


# Watch Stylus
if [[ $__watch_stylus ]]; then
    echo "  watch stylus"
    stylus --watch --out ./style/ ./style-src/*.styl
fi


# Livereload
if [[ $__livereload ]]; then
    echo "  run livereload"
    livereload . > /dev/null
fi


# Server
if [[ $__server ]]; then
    server_port=8083;
    echo "  run server at port ${server_port}"
    http-server -p $server_port > /dev/null;
fi

