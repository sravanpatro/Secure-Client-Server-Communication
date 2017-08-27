all: SSL-Server SSL-Client
SSL-Server:
	gcc -Wall -o SSL-Server SSL-Server.c -lssl -lcrypto -ldl
SSL-Client:
	gcc -Wall -o SSL-Client SSL-Client.c -lssl -lcrypto -ldl
clean:
	rm -f SSL-Server SSL-Client
	
