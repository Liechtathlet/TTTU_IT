#Dockerfile: iotivity
FROM 32bit/ubuntu:12.04

MAINTAINER Daniel Brun <dbrun.brown@gmail.com>

##Environement

##Inital
RUN apt-get update -y
RUN apt-get upgrade -y

###Copy install files
ADD . /build
RUN chmod 775 /build

###Common-Pakcages
RUN apt-get install build-essential g++ -y
RUN apt-get install scons -y

###Install Java
RUN apt-get install openjdk-7-jre

##Packages for Boost
RUN sudo apt-get install libboost-dev libboost-program-options-dev libexpat1-dev libboost-thread-dev -y
###RUN sudo apt-get install python-dev autotools-dev libicu-dev build-essential libbz2-dev -y
###RUN sudo apt-get install libboost-all-dev -y

##Packages for Documentation with doxygen
RUN apt-get install doxygen -y

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

RUN sudo /build/setup.iotivity.sh
RUN sudo chown -R -c developer: /home/developer/.atom
