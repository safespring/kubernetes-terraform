#!/bin/bash
set -o pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

pushd conda

if [ -e "environment.yml" ]; then
    ENV=$(head -n 1 environment.yml | cut -f2 -d ' ')
    if [[ $PATH != *$ENV* ]]; then
      source activate $ENV
      if [ $? -eq 0 ]; then
        echo "'$ENV' already exists."
      else
        echo "'$ENV' environment is being created."
        conda env create -q
        source activate $ENV
      fi
    fi
fi

popd

set -e

if [ ! -x ./tls/bin/cfssl -o ! -x ./tls/bin/cfssljson ]; then
    echo "Fetching cfssl binaries" >&2
    mkdir -p "./tls/bin"
    if [ "$(uname -sm)" = "Linux x86_64" ]; then
	variant=linux-amd64
    elif [ "$(uname -sm)" = "Darwin x86_64" ]; then
	variant=darwin-amd64
    else
	echo "Unknown OS variant: $(uname -sp)" >&2
	exit 1
    fi
    curl -sSL -o "./tls/bin/cfssl" "https://pkg.cfssl.org/R1.2/cfssl_${variant}"
    chmod +x "./tls/bin/cfssl"
    curl -sSL -o "./tls/bin/cfssljson" "https://pkg.cfssl.org/R1.2/cfssljson_${variant}"
    chmod +x "./tls/bin/cfssljson"
fi

./tls/init_cas.sh
