ssh john_whitton@13.93.161.116 -p 22
wget https://software.intel.com/file/489950/download

# Follow the instructions in IntelonAzureBuildInstructions.text to install the open-cli driver 1.2

#  do a system reboot here from the console
# Install mesa-common-dev
sudo apt-get install mesa-common-dev
# Check open-cli is there

clinfo
# Get the clinfo package from here https://www.howtoinstall.co/en/ubuntu/trusty/clinfo
sudo apt-get update
sudo apt-get install clinfo
clinfo

# Download the gen-oil version of the miner from https://github.com/Genoil/cpp-ethereum?
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/cuda-repo-ubuntu1404_7.5-18_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1404_7.5-18_amd64.deb
sudo apt-get -y install software-properties-common
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install git cmake libcryptopp-dev libleveldb-dev libjsoncpp-dev libjson-rpc-cpp-dev libboost-all-dev libgmp-dev libreadline-dev libcurl4-gnutls-dev ocl-icd-libopencl1 opencl-headers mesa-common-dev libmicrohttpd-dev build-essential cuda -y
git clone https://github.com/Genoil/cpp-ethereum/
cd cpp-ethereum/
mkdir build
cd build
cmake -DBUNDLE=miner ..
make -j8

#Connect it to Parity node
ethminer -G -F "http://54.191.51.165:8545"
