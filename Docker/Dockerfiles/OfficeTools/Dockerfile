#Dockerfile: Office Tools
#FROM ubuntu:latest
FROM i686/ubuntu
#phusion/baseimage:latest
MAINTAINER Daniel Brun <dbrun.brown@gmail.com>

##Environement
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

##Inital
RUN apt-get update -y
RUN apt-get upgrade -y

###Common-Pakcages
RUN apt-get install build-essential -y              # Make
RUN apt-get install software-properties-common -y

# pandoc
#RUN add-apt-repository -y ppa:hvr/ghc
#RUN add-apt-repository ppa:justinbogner/haskell-platform -y
#RUN apt-get update -y
#RUN apt-get install ghc-head -y
#RUN apt-get install cabal-install-head -y
#RUN cabal update
#RUN cabal install pandoc pandoc-citeproc

#TODO: Either modify atom for env or set config for pandoc path / copy config.cson from .atom
#TODO: set pandoc path into path
# export PATH=$PATH:~/.cabal/bin

##create movable executable
#RUN cabal install hsb2hs
#RUN cabal install --flags="embed_data_files" pandoc pandoc-citeproc

#RUN apt-get purge haskell-platform -y

#Package: LaTex#
#RUN apt-get install texlive-full -y

ADD . /build
RUN chmod 775 /build
#Run
RUN /build/setup.atom.sh
RUN /build/setup.pandoc.sh

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

CMD /usr/bin/X11/atom
