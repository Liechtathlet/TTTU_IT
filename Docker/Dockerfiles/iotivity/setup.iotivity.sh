#Setup "iotivity"
##Download and install boost

###http://sourceforge.net/projects/boost/files/boost/1.55.0/boost_1_55_0.tar.gz/download
#tar xzvf boost_1_55_0.tar.gz
#cd boost_1_55_0/
#./bootstrap.sh --with-libraries=system,filesystem,date_time,thread,regex,log,iostreams,program_options --prefix=/usr/local

#./b2 install
#sh -c 'echo '/usr/local/lib' >> /etc/ld.so.conf.d/local.conf'
#ldconfig


##Download and compile libraries
###https://www.iotivity.org/downloads
##extract
###Build all
make linux
scons

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
cd iotivityroot
doxygen


https://www.iotivity.org/documentation/iotivity-services/getting-started-iotivity-services
