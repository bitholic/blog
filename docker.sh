#!/bin/bash

BLOG_HOME=/Users/bitholic/Bitholic/blog

build() {
    docker run --rm \
        -v="$BLOG_HOME:/srv/jekyll" \
        -it jekyll/jekyll:latest \
        jekyll build
}

run() {
    docker run --rm -p 8000:8000 \
        -v="$BLOG_HOME:/srv/jekyll" \
        -it jekyll/jekyll:latest \
        jekyll serve --watch --port 8000
}

if [ "$1" == "build" ]; then
    build
else
    run
fi

