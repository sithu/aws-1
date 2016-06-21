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
parity --pruning "fast" --force-sealing --rpc --maxpeers "100" --cache "3062" --author "cff9b7b5144f3f625b4ceb287d760d16b8a042d7"  --webapp-port "8080" --webapp-interface "all" --webapp-user "admin" --webapp-pass "admin" --jsonrpc-interface "all" -jw
nohup parity --pruning "fast" --force-sealing --rpc --maxpeers "100" --cache "3062" --author "cff9b7b5144f3f625b4ceb287d760d16b8a042d7"  --webapp-port "8080" --webapp-interface "all" --webapp-user "admin" --webapp-pass "admin" --jsonrpc-interface "all" -jw > /dev/null &
# note you can view the jobs with a ps -ef | grep parity
# you can kill the job using kill -9 2806 (where 2806 is the pid you got whenn you did your ps -ef | grep parity)
