#Get the tools
#Get the miner
sudo add-apt-repository ppa:ethereum/ethereum-qt
sudo add-apt-repository ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install cpp-ethereum
#Connect it to Parity node
ethminer -G -F "http://54.200.196.231:8545"
#Run the miner
