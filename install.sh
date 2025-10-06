#!/bin/bash -e
source versions.sh

if [ "$(which venv/bin/uv)" == "" ]; then
    python -m venv venv
    venv/bin/pip install uv
fi
venv/bin/uv python install $PY_VERSIONS

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install $NODE_VERSION

rustup update
