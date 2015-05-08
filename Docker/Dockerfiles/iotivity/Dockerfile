#Dockerfile: iotivity
FROM ubuntu:14.04

MAINTAINER Daniel Brun <dbrun.brown@gmail.com>
##Environement

##Inital
RUN apt-get update -y
RUN apt-get upgrade -y

###Copy install files
ADD . /build
RUN chmod 775 /build

###Common-Pakcages
RUN apt-get install sudo wget -y
RUN apt-get install build-essential g++ -y
RUN apt-get install scons -y
RUN apt-get install git -y

###Install Java
RUN apt-get install openjdk-7-jre -y


## Setup User
# Setup X11-socket sharing for gui applications
# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

USER developer
ENV HOME /home/developer


##Install Software
#RUN SUDO sh /build/setup.iotivity.sh
