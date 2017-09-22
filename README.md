# Description

This is the showcase project to demonstrate all components provided by [ScadaJS](https://github.com/aktos-io/scada.js), authentication and authorization mechanism, realtime capabilities and some component customizations. 

# Live Demo

See in action at https://aktos.io/showcase

# Install

1. Install [Node.js](https://nodejs.org/en/download/)

2. Install global dependencies for the first time, **as admin/root**

       npm install -g gulp livescript@1.4.0

3. Download the project template, install project dependencies:

       git clone https://github.com/aktos-io/scadajs-template myproject
       cd myproject
       git submodule update --init --recursive
       cd scada.js
       npm install

# Run

If you are on Linux, following commands will start everything needed for development:

1. On the first terminal:

       ./uidev.service

2. On the second terminal:

       ./server.service

### The Manual Way

1. Start continuous build of showcase webapp:

       cd scada.js
       gulp --webapp showcase

2. Start webserver and dcsserver:

       cd servers
       ./run-ls webserver.ls

3. Your webserver should [start on port 4001](./servers/configuration.ls). Open your web browser and go to [http://localhost:4001](http://localhost:4001).

4. *Optional:* To monitor all traffic, run `monitor.ls`:

        cd servers
        ./run-ls monitor.ls
