#Setup development environment for Web

##Install Node.js
apt-get install nodejs -y
apt-get install npm -y

ln -s `which nodejs` /usr/bin/node

##Install Yeoman, Bower and Grunt
npm install -g yo
npm install -g bower
npm install -g grunt-cli

##Install JHipster
npm install -g generator-jhipster
npm install -g jhipster-uml


##Install compass
sudo apt-get install ruby-full
sudo gem install sass
sudo gem install compass
