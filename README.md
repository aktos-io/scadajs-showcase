# Description 

This is a template project to get up and start running with [scada.js](https://github.com/aktos-io/scada.js). 

# Directory structure 

Your webapps should go to `webapps/` directory in order to let scada.js find your webapps. Your other components, such as webservers, microservices etc. will stay in `this` directory.

# Install

1. Download the project template: 

    git clone https://github.com/ceremcem/scadajs-template-project myproject

2. Follow the instructions on [scada.js/install](https://github.com/aktos-io/scada.js#install) section.

3. Follow the instructions on [scada.js/start your project](https://github.com/aktos-io/scada.js/blob/master/README.md#start-your-project) section 
    
# Run 

## Linux 

On Linux, we can benefit from [aea-way](https://github.com/aktos-io/scada.js/blob/master/doc/aea-way.md) out of the box: 

1. Start continuous build of webapp 

    ./uidev.service 
    
2. Start webserver/dcsserver and other services 

    ./server.service 

## Windows or Manual Way

### Simple 

1. Start continuous build of webapp: 
 
       cd scada.js
       gulp --webapp showcase 
       
2. View your webapp 

    your-browser scada.js/build/html-js/index.html

### With webserver/dcsserver support 

1. Start continuous build of webapp (follow the instructions above) 

2. Start webserver/dcsserver: 
  
       cd webserver
       ./run-ls server.ls 
       
3. Your webserver should [start on port 4001](./webserver/configuration.ls). Open your web browser and go to [localhost:4001](http://localhost:4001). 

