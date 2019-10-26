# SOA4ID
## Service-oriented architecture for emerging systems

Microservices for a restaurant chain:
 - Microservice on Nodejs for a catalogue of restaurants.
 - Microservice on Ruby for users and clients service.
 - Microservice on Golang for control of orders service.
 - Reports service on Python about business and orders.
 - The system database work on Neo4j and MySQL for the microservices.
 
The microservices work on a cluster in kubernetes with Dockers containers.

# Installation   <img src="https://img.icons8.com/color/48/000000/installing-updates.png">

## Docker  <img src="https://img.icons8.com/color/48/000000/docker.png">
For the containers of the microservices:

    $ apt-get install docker.io

For start using, must follow:

  - [Official website](https://docs.docker.com/get-started/)

## Kubernetes
For the intallation and create the cluster:

   - [Website](https://docs.projectcalico.org/v3.10/getting-started/kubernetes/)

## Nodejs  <img src="https://img.icons8.com/color/48/000000/nodejs.png">
Install nodejs in your computer:

    $ apt-get install nodejs
  
    $ apt-get install npm
    
## Ruby  <img src="https://img.icons8.com/color/48/000000/ruby-programming-language.png">
Packages needed:
    
    $ sudo apt-get install curl build-essential libpq-dev sqlite3 nodejs

Install Ruby using RVM:
    
    $ \curl -sSL https://get.rvm.io | bash
    
    $ echo 'source "$HOME/.rvm/scripts/rvm"' >> ~/.bashrc
    
    $ rvm install ruby
    
Install Ruby on rails: 
    
    $ gem install rails -v 5.1.0
    
A Ruby implementation of [GraphQL](https://graphql.org/)   <img src="https://cloud.githubusercontent.com/assets/2231765/9094460/cb43861e-3b66-11e5-9fbf-71066ff3ab13.png" height="40" alt="graphql-ruby"/>

   - [Website](https://graphql-ruby.org/)
   
   - [API Documentation](https://www.rubydoc.info/gems/graphql)
    
   - [Newsletter](https://tinyletter.com/graphql-ruby)
 
 ## Golang  <img src="https://img.icons8.com/color/48/000000/golang.png">
 For the installation:
     
     $ sudo curl -O https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz  
     
     $ sudo tar -xvf go1.9.linux-amd64.tar.gz 
     
     & sudo mv go /usr/local  
     
     & echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.profile  
     
     & source ~/.profile  
 
  Here an example: 
    
   - [Website](https://juliensalinas.com/es/instalar-go-golang-1-9-en-ubuntu-17-10/)
   
## Python   <img src="https://img.icons8.com/color/48/000000/python.png">
Installations needed: 
    
    $ apt-get install python3
    
    $ apt-get install pip
    
    $ pip install flask-restful
    
    $ pip install mysql-connector-python

  
# Authors

  - Gerardo Zeledón Martínez
  
  - Juan Daniel Esquivel Rojas



