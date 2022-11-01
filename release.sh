#!/bin/bash
docker run -it --rm -v $PWD:/target/ -v $HOME/.pause:/root/.pause -v $HOME/.ssh:/root/.ssh --name minil-release-app docker-minil-release "$@"

