# Dockerfile: IONIDE
FROM debian:jessie

MAINTAINER Daniel Brun <dbrun.brown@gmail.com>

## Update System
RUN apt-get update -y
RUN apt-get upgrade -y

## Install Mono
RUN apt-get update && apt-get install -y \
	libasound2 \
	libatk1.0-0 \
	libcairo2 \
	libcups2 \
	libdatrie1 \
	libdbus-1-3 \
	libfontconfig1 \
	libfreetype6 \
	libgconf-2-4 \
	libgcrypt20 \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	libgdk-pixbuf2.0-0 \
	libglib2.0-0 \
	libgtk2.0-0 \
	libgpg-error0 \
	libgraphite2-3 \
	libnss3 \
	libnspr4 \
	libpango-1.0-0 \
	libpangocairo-1.0-0 \
	libxcomposite1 \
	libxcursor1 \
	libxdmcp6 \
	libxi6 \
	libxrandr2 \
	libxrender1 \
	libxtst6 \
	liblzma5 \
	--no-install-recommends

## Install Mono and F#
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb http://download.mono-project.com/repo/debian wheezy main" | tee /etc/apt/sources.list.d/mono-xamarin.list

RUN apt-get install -y software-properties-common mono-complete fsharp

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
	atom-terminal-panel

#tidy-markdown,

## Configure atom
RUN chown -cR user: /home/user/.atom
USER user
ENTRYPOINT [ "atom", "--foreground" ]
