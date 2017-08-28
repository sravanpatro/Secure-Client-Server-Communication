# Secure-Client-Server-Communication
Secure SSL connection between client and server using openssl with dockerization

First generate a self-signed certificate using the following command

         openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mycert.pem -out mycert.pem

mycert.pem is the name of certificate file

SSL-Server.c and SSL-Client.c can be compiled using make all command.

Run the server using below command

        ./SSL-Server <Portnum>

and client using below command

        ./SSL-Client <hostname> <portno>

# Dockerizing server

Steps required for Docker:
Docker is supported only on 64bit OS
Environment: 
      OS: ubuntu-16.04.1
      Machine type: 64 bit

          apt-get update
          apt-get remove docker docker-engine docker.io
          apt-get update
          apt-get install apt-transport-https ca-certificates curl software-properties-common
# First, add the GPG key for the official Docker repository to the system:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
# Add the Docker repository to APT sources:
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update

# Use the following command to add the GPG key for the official Docker repository to the system-
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
# Make sure to add the following to docker.list file
     echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
     sudo apt-get update
     apt-cache policy docker-engine
Notice that, docker-engine is not installed,to install Docker-engine, use the following command –
$ sudo apt-get install -y docker-engine


To check whether docker is started or not, use the following command –

$ sudo systemctl status docker

    docker version
    docker run hello-world
Once docker is successfully installed, then run the server_start.sh script to start the server in docker

Client can be run 

    gcc -Wall -o SSL-Client SSL-Client.c -lssl -lcrypto -ldl
    ./SSL-Client <hostname> <portno>
    Note: Server is running inside the docker. So to get the hostname do 
    docker inspect <server container-id> | grep -i ipaddress
    
Alternately client can also run in docker. 
 
    ./client_start.sh 




