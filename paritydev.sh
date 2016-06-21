# Get the tools needed to run parity
sudo apt-get clean
sudo apt-get update
sudo apt-get install build-essential
sudo apt-get install git-all
curl -sf https://raw.githubusercontent.com/brson/multirust/master/quick-install.sh | sh
multirust update stable
sudo apt-get install libstdc++6
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
# Download Parity
wget https://github.com/General-Beck/parity/releases/download/v1.2.0-cross-devel.1/parity-v1.2.0-cross-devel.1-x86_64-unknown-linux-gnu-beta.tar.gz
tar -xvzf parity-v1.2.0-cross-devel.1-x86_64-unknown-linux-gnu-beta.tar.gz
sudo cp ./target/x86_64-unknown-linux-gnu/release/parity /usr/local/bin/
rm -rf target/
rm parity-v1.2.0-cross-devel.1-x86_64-unknown-linux-gnu-beta.tar.gz

# Create password file used to unlock account when running parity
echo PolyDev01 > password.txt

# Get the default account note you will need to enter the password (used PolyDev01)
parity account new
parity account list
# First Run created account faa5f4159c732b38b755a742aff2bf59218c50b5
# Also created 67f726a1d40f2e34fedb2e7aefe2214e722dd948 and c6efb86f0d7ccf6b188fee08e5ed6f37871b947a

# Run Parity in foreground
#parity --testnet --unlock faa5f4159c732b38b755a742aff2bf59218c50b5 --password "./password.txt" --pruning "fast" --force-sealing --rpc --maxpeers "100" --cache "3062" --author "70e84041de436631508099b3f2504315cb31a907"  --webapp-port "8080" --webapp-interface "all" --webapp-user "admin" --webapp-pass "admin" --jsonrpc-interface "all" --rpccorsdomain "*" -jw
parity --testnet --pruning "fast" --force-sealing --rpc --maxpeers "100" --cache "3062" --author "70e84041de436631508099b3f2504315cb31a907"  --webapp-port "8080" --webapp-interface "all" --webapp-user "admin" --webapp-pass "admin" --jsonrpc-interface "all" --rpccorsdomain "*" -jw
# on Mac
# parity --testnet --geth --pruning "fast" --force-sealing --rpc --maxpeers "100" --cache "3062" --author "cff9b7b5144f3f625b4ceb287d760d16b8a042d7"  --webapp-port "8080" --webapp-interface "all" --webapp-user "admin" --webapp-pass "admin" --jsonrpc-interface "all" --rpccorsdomain "*" -jw

# Test it by going to http://54.191.51.165:8080/ in a browser to see the admin console
# Test mining by running the following locally ethminer -G --opencl-device 1 -F "http://54.191.51.165:8545"
# Note mining will be unable to get a package until block synchs

# Now run parity in background mode and test again
# Run the parity unlocking an account and using testnet (notice the nohup with an & at the end will run it in background)
# note you can view the jobs with a ps -ef | grep parity
# you can kill the job using kill -9 2806 (where 2806 is the pid you got whenn you did your ps -ef | grep parity)
#nohup parity --testnet --unlock faa5f4159c732b38b755a742aff2bf59218c50b5 --password "./password.txt" --pruning "fast" --force-sealing --rpc --maxpeers "100" --cache "3062" --author "70e84041de436631508099b3f2504315cb31a907"  --webapp-port "8080" --webapp-interface "all" --webapp-user "admin" --webapp-pass "admin" --jsonrpc-interface "all" --rpccorsdomain "*" -jw > /dev/null &
nohup parity --testnet --pruning "fast" --force-sealing --rpc --maxpeers "100" --cache "3062" --author "cff9b7b5144f3f625b4ceb287d760d16b8a042d7"  --webapp-port "8080" --webapp-interface "all" --webapp-user "admin" --webapp-pass "admin" --jsonrpc-interface "all" --rpccorsdomain "*" -jw > /dev/null &
