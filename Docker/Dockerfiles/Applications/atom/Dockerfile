# Dockerfile: ATOM
FROM debian:jessie

MAINTAINER Daniel Brun <dbrun.brown@gmail.com>

## Update System
RUN apt-get update -y
RUN apt-get upgrade -y

## Install Dependencies
RUN apt-get install -y \
	git \
	gconf2 \
	gconf-service \
	gvfs-bin \
	libasound2 \
	libgconf-2-4 \
	libgnome-keyring-dev \
	libgtk2.0-0 \
	libnotify4 \
	libnss3 \
	libxtst6 \
	xdg-utils \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

## Set Environment
ENV ATOM_VERSION 1.5.3

## Install atom
RUN buildDeps=' \
		ca-certificates \
		curl \
	' \
	&& set -x \
	&& apt-get update && apt-get install -y $buildDeps --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/* \
	&& curl -sSL https://github.com/atom/atom/releases/download/v${ATOM_VERSION}/atom-amd64.deb -o /tmp/atom-amd64.deb \
	&& dpkg -i /tmp/atom-amd64.deb \
	&& rm -rf /tmp/*.deb \
	&& apt-get purge -y --auto-remove $buildDeps


## Setup User
ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user	&& chown -R user:user $HOME

## atom.io packages
RUN apm install markdown-scroll-sync \
	markdown-folder \
	language-markdown \
	markdown-assistant \
	angularjs \
	markdown-helpers \
	markdown-table-formatter \
	todo-show \
	merge-conflicts \
	numeric-aggregators \
	language-latex \
	latexer \
	pandoc \
	texlicious \
	hex \
	atom-terminal-panel \
	atom-shortcuts \
	markclip

#tidy-markdown,

## Configure atom
RUN chown -cR user: /home/user/.atom

ENTRYPOINT [ "atom", "--foreground" ]
