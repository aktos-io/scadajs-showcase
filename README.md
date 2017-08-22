# Description

This is the template project to get up and running quickly with [scada.js](https://github.com/aktos-io/scada.js).

# Live Demo

This project can be seen in action at https://aktos.io/showcase

# Install

1. Install [Node.js](https://nodejs.org/en/download/)

2. Install global dependencies (if you didn't already):

       # npm install -g gulp yarn livescript@1.4.0

3. Download the project template, install project dependencies:

       git clone https://github.com/aktos-io/scadajs-template myproject
       cd myproject
       git submodule update --init --recursive
       cd scada.js
       yarn  # or `npm install`

# Run

If you are on Linux, following commands will start everything needed for development:

1. On first terminal:

       ./uidev.service

2. On second terminal:

       ./server.service

### The Manual Way

1. Start continuous build of webapp:

       cd scada.js
       gulp --webapp showcase

2. Start webserver/dcsserver:

       cd servers
       ./run-ls webserver.ls

3. Your webserver should [start on port 4001](./servers/configuration.ls). Open your web browser and go to [http://localhost:4001](http://localhost:4001). 

4. [Optional] If you want to monitor all messaging traffic, run monitor:

        cd servers
        ./run-ls monitor.ls
