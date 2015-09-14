#Dockerfile: javadev
FROM ubuntu:trusty

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
RUN apt-get install git -y
RUN apt-get install software-properties-common -y

RUN apt-get update -y

###Install Java
RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt-get install openjdk-8-jdk -y
RUN apt-get install openjdk-7-jdk -y


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
RUN sudo sh /build/setup.devenv.java.sh
RUN sudo sh /build/setup.devenv.web.sh
