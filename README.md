# Description 

This is a template project to get up and start running with [scada.js](https://github.com/aktos-io/scada.js). 

# Install

1. Install global dependencies (if you didn't already): 

       npm install -g gulp yarn livescript@1.4.0

2. Download the project template, install project dependencies: 

       git clone https://github.com/ceremcem/scadajs-template-project myproject
       cd myproject 
       git submodule update --init --recursive
       cd scada.js
       yarn  # or `npm install`
    
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
