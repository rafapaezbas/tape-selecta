############################################################
# Dockerfile to run Java
# Based on Ubuntu Image
############################################################

# Set the base image to use to Ubuntu
FROM ubuntu

# Update the default application repository sources list
RUN apt-get update

# Install icecast2
RUN apt-get install -y icecast2

# Install mp3info
RUN apt-get install -y mp3info

#Install ezstream
RUN apt-get install -y ezstream

#Copy icecast configuration
COPY icecast/icecast.xml /etc/icecast2/icecast.xml

#Copy ezstream configuration
COPY ezstream/ezstream_mp3.xml /home

#Copy selector script
COPY selector.sh /home

# Install node
RUN apt-get install -y nodejs

# Install npm
RUN apt-get install -y npm

# Create info dir
RUN mkdir /home/info

#Copy info service code
COPY info/* /home/info/

#Install npm dependecies for infor service
RUN cd /home/info && npm install

#Enable init.d
COPY icecast/icecast2 /etc/default/icecast2

#Expose icecast port
EXPOSE 8000

#Expose info port
EXPOSE 3000

#Start icecast2, wait unit is ready, run ezstream and info service, then run a bash console
ENTRYPOINT service icecast2 restart && ezstream -c /home/ezstream_mp3.xml & node /home/info/index.js & /bin/bash

