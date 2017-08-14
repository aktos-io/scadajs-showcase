# Description 

This is a template project to get up and start running with [scada.js](https://github.com/aktos-io/scada.js). 

# Install

1. Download the project template: 

       git clone https://github.com/ceremcem/scadajs-template-project myproject

2. [Follow the instructions](https://github.com/aktos-io/scada.js/blob/master/README.md#install-global-dependencies) to install global requirements.

3. [Follow the instructions](https://github.com/aktos-io/scada.js/blob/master/README.md#install-dependencies-per-project) to install scada.js project dependencies. 
    
# Run 

If you are on Linux, following commands will start everything needed for development: 

    ./uidev.service --background
    ./server.service 

### Manual way 

1. Start continuous build of webapp: 
 
       cd scada.js
       gulp --webapp showcase 
       
2. Start webserver/dcsserver: 
  
       cd webserver
       ./run-ls server.ls 
       
3. Your webserver should [start on port 4001](./webserver/configuration.ls). Open your web browser and go to [localhost:4001](http://localhost:4001). 

# Live Demo 

This project can be seen in action at https://aktos.io/showcase
