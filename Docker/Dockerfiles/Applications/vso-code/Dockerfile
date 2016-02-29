# Dockerfile: VisualStudio Code
FROM debian:jessie

MAINTAINER Daniel Brun <dbrun.brown@gmail.com>

## Update System
RUN apt-get update -y
RUN apt-get upgrade -y

## Install Dependencies
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

## Setup User
ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user	&& chown -R user:user $HOME

## Install Mono and F#
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb http://download.mono-project.com/repo/debian wheezy main" | tee /etc/apt/sources.list.d/mono-xamarin.list

RUN apt-get install -y software-properties-common mono-complete fsharp

## VSO
RUN buildDeps=' \
		ca-certificates \
		curl \
		unzip \
	' \
	&& set -x \
	&& apt-get update && apt-get install -y $buildDeps --no-install-recommends \
	&& curl -sL https://deb.nodesource.com/setup | bash - \
	&& apt-get update && apt-get install -y nodejs --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/* \
	&& curl -sSL https://az764295.vo.msecnd.net/public/0.10.6-release/VSCode-linux64.zip -o /tmp/vs.zip \
	&& unzip /tmp/vs.zip -d /usr/src/ \
	&& rm -rf /tmp/vs.zip \
	&& apt-get purge -y --auto-remove $buildDeps



COPY start.sh /usr/local/bin/start.sh
RUN chmod 777 /usr/local/bin/start.sh
WORKDIR $HOME

## Install Extensions
#RUN code ionide-fsharp

ENTRYPOINT [ "/usr/local/bin/start.sh", "--foreground" ]
