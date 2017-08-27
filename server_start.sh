
#stop the active dockers
docker ps -a | grep docker_server | awk -F" " '{print "docker stop " $1}' > run
sh -x run
rm -f run

#remove the server container
docker ps -a | grep docker_server | awk -F" " '{print "docker rm -f "$1}' > check_run
sh -x check_run
rm -f check_run

#remove the image
docker rmi -f docker_server
docker images

#build the docker image for server
docker build -t docker_server -f Dockerserver .

#run the docker server container
docker run -p 5000:5000 --name docker_server_inst -d docker_server
