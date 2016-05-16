#Upgrade linux and drivers
#Load open-cli (notes came from https://forum.ethereum.org/discussion/comment/8889/#Comment_8889)
sudo apt-get update
sudo apt-get install linux-generic
# Reboot from the console and wait a while (may get some connection errors initially)
# Get the ubuntu 14.4 version of the CUDA Toolkit and run it https://developer.nvidia.com/cuda-downloads
# wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/cuda-repo-ubuntu1404_7.5-18_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1404_7.5-18_amd64.deb
sudo apt-get update
sudo apt-get install cuda

# Probaly want to do a system reboot here from the console

# Get the clinfo package from here https://www.howtoinstall.co/en/ubuntu/trusty/clinfo
sudo apt-get update
sudo apt-get install clinfo
clinfo

#Get the tools
#Get the miner
sudo add-apt-repository ppa:ethereum/ethereum-qt
sudo add-apt-repository ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install cpp-ethereum
# Get the clinfo package from here https://www.howtoinstall.co/en/ubuntu/trusty/clinfo
sudo apt-get update
sudo apt-get install clinfo
#Check the miner is now loaded and whether you can see the devices
ethminer --help
ethminer --list-devices
#Get the drivers for NVIDIA GRID GPU (Kepler GK104) - info http://docs.nvidia.com/cuda/cuda-installation-guide-linux/#axzz48pRerPQS
# The next 3 steps are optional to check that your ubuntu version and nvidia info
lspci | grep -i nvidia
uname -m && cat /etc/*release
sudo apt-get install linux-headers-$(uname -r)
# Get the ubuntu 14.4 version of the CUDA Toolkit and run it https://developer.nvidia.com/cuda-downloads
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/cuda-repo-ubuntu1404_7.5-18_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1404_7.5-18_amd64.deb
sudo apt-get update
sudo apt-get install cuda


#Connect it to Parity node
ethminer -G -F "http://54.200.196.231:8545"
