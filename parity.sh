# Get the tools needed to run parity
sudo apt-get clean
sudo apt-get update
sudo apt-get install build-essential
sudo apt-get install git-all
curl -sf https://raw.githubusercontent.com/brson/multirust/master/quick-install.sh | sh
multirust update stable
# Clone and build Parity
git clone -b beta  https://github.com/ethcore/parity
cd parity
sudo cargo build --release
sudo cp target/release/parity /usr/local/bin
#Create a Passworf file
echo "May2016!" > password.txt
# Get the default account note you will need to enter the password
parity account new
parity account list
# Run the parity node using the account you just created or your own local account
#parity --testnet -jw --jsonrpc-cors "http://localhost:8081" --unlock 0xca28493b99971a6289ddfd50b313999694d41b7b --password './target/release/password.txt' -l own_tx=trace
parity --pruning "fast" --force-sealing --rpc --maxpeers "100" --cache "3062" --author "90f2682dc5be188527db4d0299674d846b8ab8f3" -j
