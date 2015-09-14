#Setup "Android Development Environment"

ANDROIDSTUDIO_DOWNLOAD_LINK=https://dl.google.com/dl/android/studio/ide-zips/1.2.0.12/android-studio-ide-141.1890965-linux.zip
AS_TMP_DIR=/tmp/android

STACK_DIR=/home/developer/stacks
ANDROID_DIR=$STACK_DIR/android
AS_DIR=$ANDROID_DIR/studio
ASDK_DIR=$ANDROID_DIR/sdk
ANDK_DIR=$ANDROID_DIR/ndk
ANDK_VER=android-ndk-r10c

##Create directories
mkdir $AS_TMP_DIR
mkdir $ANDROID_DIR
mkdir $AS_DIR
mkdir $ASDK_DIR
mkdir $ANDK_DIR

##Install dependencies
apt-get install unzip p7zip-full -y

##Download Android Studio
wget -O $AS_TMP_DIR/android-studio-ide-linux.zip $ANDROIDSTUDIO_DOWNLOAD_LINK
unzip -a $AS_TMP_DIR/android-studio-ide-linux.zip -C $AS_DIR


##Download Android SDK
wget -O $AS_TMP_DIR/android-sdk.tgz http://dl.google.com/android/android-sdk_r24.2-linux.tgz
tar -zxvf $AS_TMP_DIR/android-sdk.tgz -C $ANDROID_DIR

##Download Android NDK
wget -O  $ANDK_DIR/$ANDK_VER.bin http://dl.google.com/android/ndk/$ANDK_VER-linux-x86_64.bin
chmod a+x $ANDK_DIR/$ANDK_VER.bin

##Change directory and ownership
sudo chown -R developer: $ANDROID_DIR
sudo chmod -R 775 $ANDROID_DIR

##Install SDKs
cd $STACK_DIR/android-sdk-linux/tools
./android update sdk --no-ui -u -a -t 1,42,9,19,30

export ANDROID_HOME=$ASDK_DIR/android-sdk-linux


##Install NDK
cd $ANDK_DIR
7z x $ANDK_VER.bin
export ANDROID_NDK=$ANDK_DIR/$ANDK_VER

##Clean Up NDK
rm $ANDK_DIR/$ANDK_VER.bin
