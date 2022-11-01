# docker-minil-release

## pull

    docker pull ghcr.io/tokuhirom/docker-minil-release:latest

## run

    docker run -it --rm -v $PWD:/target/ -v $HOME/.pause:/root/.pause -v $HOME/.ssh:/root/.ssh --name minil-release-app ghcr.io/tokuhirom/docker-minil-release:latest

## Development

build boot image

    ./build.sh

run `./release.sh` on the working directory, that contains the project code.


