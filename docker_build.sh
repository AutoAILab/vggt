# remove container and image
docker container remove vggt-env
docker image remove vggt-env

# build image
docker build -t vggt-env .