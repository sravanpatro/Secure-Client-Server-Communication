
#stop the active dockers
docker ps -a | grep docker_client | awk -F" " '{print "docker stop " $1}' > run
sh -x run
rm -f run

#remove the client container
docker ps -a | grep docker_client | awk -F" " '{print "docker rm -f "$1}' > check_run
sh -x check_run
rm -f check_run

#remove the image
docker rmi -f docker_client
docker images

#build the docker image for client
#docker build -t docker_client -f Dockerclient .

#run the docker client container
#docker run --name docker_client_inst -d docker_client
