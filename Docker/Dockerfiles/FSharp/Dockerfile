# Dockerfile: F#
FROM ubuntu:14.04
MAINTAINER Daniel Brun <dbrun.brown@gmail.com>

##Environement
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:~/.cabal/bin

##Inital
RUN apt-get update -y
RUN apt-get upgrade -y

RUN chown root:root /usr/bin/sudo
RUN chmod 4755 /usr/bin/sudo

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
RUN sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list

RUN apt-get install software-properties-common
RUN apt-get update -y
RUN apt-get install mono-complete fsharp

RUN apt install language-pack-{gnome-,}pt

RUN add-apt-repository ppa:ubuntu-desktop/ubuntu-make
RUN apt-get update && sudo apt-get install ubuntu-make
RUN umake web visual-studio-code
