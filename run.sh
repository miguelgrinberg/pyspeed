#!/bin/bash
source versions.sh

export PATH=$PATH:~/.local/bin
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
export PATH=$PATH:$HOME/.cargo/bin
RUST_VERSION=$(rustc --version | grep -o "[1-9]\+\.[0-9]\+")

run() {
    APP=$1
    shift

    echo $APP
    echo --

    # python
    for VERSION in $PY_VERSIONS; do
        export UV_PYTHON=$VERSION
        ./t.sh "$VERSION" uv run python $APP.py $*
        if [[ $PYJIT_VERSIONS =~ $VERSION ]]; then
            PYTHON_JIT=1 ./t.sh "${VERSION}jit" uv run python $APP.py $*
        fi
    done

    # node
    ./t.sh "node$NODE_VERSION" node $APP.js $*

    # rust
    rustc -O $APP.rs
    ./t.sh "rust$RUST_VERSION" ./$APP $*

    echo ""
}

run fibo 10 20 30 40
run bubble 10000
