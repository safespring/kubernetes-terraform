#!/bin/bash
pushd conda

if [ -e "environment.yml" ]; then
    ENV=$(head -n 1 environment.yml | cut -f2 -d ' ')
    if [[ $PATH != *$ENV* ]]; then
      source activate $ENV
      if [ $? -eq 0 ]; then
        echo "'$ENV' already exists."
      else
        echo "'$ENV' environment is being created."
        conda env create -q --file=environment.yml
      fi
    fi
fi

popd