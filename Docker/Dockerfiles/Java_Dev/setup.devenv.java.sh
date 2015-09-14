#Setup development environment for Java

STACK_DIR=/home/developer/stacks
ECLIPSE_VER=eclipse-java-luna
ECLIPSE_DIR=$STACK_DIR/$ECLIPSE_VER
MODELIO_VER=modelio-3.3.1
MODELIO_DIR=$STACK_DIR/$MODELIO_VER

mkdir $ECLIPSE_DIR
wget -O /tmp/$ECLIPSE_VER.tar.gz http://mirror.netcologne.de/eclipse//technology/epp/downloads/release/luna/SR2/eclipse-jee-luna-SR2-linux-gtk-x86_64.tar.gz
tar -xzvf /tmp/$ECLIPSE_VER.tar.gz -C $STACK_DIR

##Install additional tools
apt-get install maven -y

##Install java
apt-get install openjdk-7-jdk

##Install modelio
apt-get -y install libwebkitgtk-1.0-0 libwebkitgtk-3.0-0
apt-get -y install libc6 libatk libcairo libgtk2 libglib2 libwebkit-1.0 libxtst6 stdc++6
wget -O /tmp/$MODELIO_VER.tar.gz https://www.modelio.org/modelio-122/doc_download/103-modelio-331-linux-64-bit.html
tar -xzvf /tmp/$MODELIO_VER.tar.gz -C $STACK_DIR

##Manual install
###UML Designer


#Notes:
echo "Installierte JDK's: update-java-alternatives -l"
echo "JDK wechseln: sudo update-alternatives --config java"
