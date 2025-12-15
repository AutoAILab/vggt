# remove container and image
docker container remove vggt-env

# run in interactive mode using bash
docker run --mount type=bind,src="/home/df/data/jflinte/vggt",dst=/app -it --gpus all --name vggt-env vggt-env bash