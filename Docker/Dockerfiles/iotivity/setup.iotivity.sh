#Setup "iotivity"
##Define variables and paths
STACK_DIR=/home/developer/stacks
IOTIVITY_DIR=$STACK_DIR/iotivity
IOTIVITY_VER_DIR=$IOTIVITY_DIR/iotivity-0.9.0
IOTIVITY_OUT_DIR=$IOTIVITY_VER_DIR/out/linux/x86_64/release
EXT_LIBS_DIR=$IOTIVITY_VER_DIR/extlibs
IOTIVITY_TMP_DIR=/tmp/iotivity

##Create required directories
mkdir $STACK_DIR
mkdir $IOTIVITY_DIR
mkdir $EXT_LIBS_DIR
mkdir $IOTIVITY_TMP_DIR

##Install dependencies
###Packages for boost
apt-get install libboost-dev libboost-program-options-dev libexpat1-dev libboost-thread-dev -y

###Packages for documentation with doxygen
apt-get install doxygen -y

##Libraries for compilation
apt-get install libssl-dev

##Download libraries
wget -O $IOTIVITY_TMP_DIR/iotivity-0.9.0.tar.gz http://downloads.iotivity.org/0.9.0/iotivity-0.9.0.tar.gz
tar -xzvf $IOTIVITY_TMP_DIR/iotivity-0.9.0.tar.gz -C $IOTIVITY_DIR

###Download and patch cereal
git clone https://github.com/USCiLab/cereal.git $EXT_LIBS_DIR/cereal
cd $EXT_LIBS_DIR/cereal
git reset --hard 7121e91e6ab8c3e6a6516d9d9c3e6804e6f65245
git apply ../../resource/patches/cereal_gcc46.patch

##Change directory and ownership
cd $IOTIVITY_VER_DIR
sudo chown -R developer: $IOTIVITY_DIR
sudo chmod -R 775 $IOTIVITY_DIR

##Compile libraries
scons
export LD_LIBRARY_PATH=$IOTIVITY_OUT_DIR

###Build only C SDK
#### cd  iotivity/resource/csdk/build/linux/
#### make


####Build only C++ SDK
#### cd iotivity/resource/build/linux/
#### make

###Build only C++ Examples
#### cd  iotivity/resource/examples/
#### make

##Generate Documentation
#cd iotivityroot
#doxygen
