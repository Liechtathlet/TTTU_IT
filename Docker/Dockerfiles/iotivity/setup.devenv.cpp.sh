#Setup development environment for c and c++

STACK_DIR=/home/developer/stacks
ECLIPSE_DIR=$STACK_DIR/eclipse
ECLIPSE_VER=eclipse-cpp-helios
ECLIPSE_CPP_DIR=$ECLIPSE_CCPLUSPLUS_DIR/$ECLIPSE_VER

mkdir $ECLIPSE_DIR
wget -O /tmp/$ECLIPSE_VER.tar.gz http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/helios/SR2/eclipse-cpp-helios-SR2-linux-gtk-x86_64.tar.gz
tar -xzvf /tmp/$ECLIPSE_VER.tar.gz -C $ECLIPSE_DIR
mv $ECLIPSE_DIR/eclipse $ECLIPSE_CPP_DIR
