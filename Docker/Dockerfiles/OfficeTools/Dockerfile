#Dockerfile: Office Tools
#FROM ubuntu:latest
#FROM i686/ubuntu
FROM 32bit/ubuntu:14.04
#phusion/baseimage:latest
MAINTAINER Daniel Brun <dbrun.brown@gmail.com>

##Environement
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:~/.cabal/bin

##Inital
RUN apt-get update -y
RUN apt-get upgrade -y

###Copy install files
ADD . /build
RUN chmod 775 /build

###Common-Pakcages
RUN apt-get install build-essential -y              # Make
RUN apt-get install software-properties-common -y

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

#Run
RUN sudo /build/setup.atom.sh
#RUN sudo chown -R developer: /home/developer/.atom
#RUN sudo /build/setup.pandoc.sh
#RUN sudo chown -R developer: /home/developer/.cabal
#RUN sudo /build/setup.latex.sh

CMD /usr/bin/X11/atom
