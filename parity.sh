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
#Create a Password file

# Get the default account note you will need to enter the password
parity account new
parity account list
# Run the parity node using own local account (notice the nohup with an & at the end will run it in background)
#parity --testnet -jw --jsonrpc-cors "http://localhost:8081" --unlock 0xca28493b99971a6289ddfd50b313999694d41b7b --password './target/release/password.txt' -l own_tx=trace
nohup parity --pruning "fast" --force-sealing --rpc --maxpeers "100" --cache "3062" --author "70e84041de436631508099b3f2504315cb31a907"  --webapp-port "8080" --webapp-interface "all" --webapp-user "admin" --webapp-pass "admin" --jsonrpc-interface "all" -jw > /dev/null &# note you can view the jobs with a ps -ef | grep parity
# you can kill the job using kill -9 2806 (where 2806 is the pid you got whenn you did your ps -ef | grep parity)
