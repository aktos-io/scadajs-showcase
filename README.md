# Description 

This is a template project to get up and start running with [scada.js](https://github.com/aktos-io/scada.js). 

# Install

1. Download the project template: 

       git clone https://github.com/ceremcem/scadajs-template-project myproject

2. Install global requirements: [scada.js/install](https://github.com/aktos-io/scada.js#install).

3. Install scada.js requirements: [scada.js/start your project](https://github.com/aktos-io/scada.js/blob/master/README.md#start-your-project) 
    
# Run 

### aea-way 

Following commands will start everything needed for development: 

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
