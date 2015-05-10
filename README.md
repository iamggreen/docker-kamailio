# docker-kamailio

This is the dockerfile i use to create a kamailio docker container

To build the image:

    docker build -t kamailio docker-kamailio
To run the container:

    docker run -d --name kamailio -p 5060:5060 -p 5060:5060/udp kamailio
    
Also I created a simple nodejs web server in ./debug-db/webserver that will display all the kamailio tables with data into the browser using websockets.

To start the web server(This will create a web server listening on port 3000):

    npm install
    node index.js

To read the mysql database and post to our web server:

    #First you need to edit the ./debug-db/upload-script file and update the appropriate port and ip
    #Open a bash prompt in the kamailio container
    docker exec -it <KAMAILIO CONTAINER ID> /bin/bash
    #paste the updated contents of ./debug-db/upload-script into the terminal
