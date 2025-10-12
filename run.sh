#!/bin/bash
source versions.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
export PATH=$PATH:$HOME/.cargo/bin
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
        export UV_PYTHON=$VERSION
        venv/bin/uv run python $APP.py $VERSION $*
        if [[ $PYJIT_VERSIONS =~ $VERSION ]]; then
            PYTHON_JIT=1 venv/bin/uv run python $APP.py ${VERSION}jit $*
        fi
    done

    if [ "$1" == "1" ]; then
        # node
        node $APP.js "node$NODE_VERSION" $*

        # rust
        rustc -O $APP.rs
        ./$APP "rust$RUST_VERSION" $*

        # Elixir (version emitted by script)
        elixir $APP.exs $2
    fi

    echo ""
}

run fibo 1 40
run bubble 1 10000
run fibo 4 40
run bubble 4 10000
