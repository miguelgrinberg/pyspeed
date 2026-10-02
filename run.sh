#!/bin/bash
source versions.sh

NODE_VERSION=$(node --version | grep -o "[1-9]\+\.[0-9]\+")
RUST_VERSION=$(rustc --version | grep -o "[1-9]\+\.[0-9]\+")

run() {
    APP=$1
    shift

    if [ "$1" == "1" ]; then
        echo $APP "(single-threaded)"
    else
        echo $APP "($1 threads)"
    fi
    echo --

    # python
    for VERSION in $PY_VERSIONS; do
        if [[ "$VERSION" =~ pypy ]]; then
            $VERSION $APP.py $VERSION $*
        else
            python$VERSION $APP.py $VERSION $*
        fi
    done

    if [ "$1" == "1" ]; then
        # node
        node $APP.js "node-$NODE_VERSION" $2

        # rust
        rustc -O $APP.rs
        ./$APP "rust-$RUST_VERSION" $2
    fi

    for VERSION in $PYEXTRA_VERSIONS; do
        PYTHON_JIT=1 python$VERSION $APP.py "${VERSION} jit" $*
        python${VERSION}t $APP.py "${VERSION} ft" $*
    done

    echo ""
}

run fibo 1 40
run bubble 1 10000
run fibo 4 40
run bubble 4 10000
