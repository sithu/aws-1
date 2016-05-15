# aws
This repository holds script used for deploying Amazon web services instances on EC2.
These scripts will be incorporated into the build process initially manually and later on as part of spot instance creation.
Additional reference material can be found at

## Script Overview
The below scripts are used to evaluate viability and profitablity of Etherum cloud mining. Cost benefit calculators and other links can be found at the [jincubator atlassian site](https://jincubator.atlassian.net/wiki/display/DES/Mining).
The concept is that we will have one stable node running parity and many potential mining nodes using ethminer connecting to the parity instance.

### Parity
This script downloads [Parity](https://github.com/ethcore/parity) and the tools needed to build and run a parity instance

### Ethminer
This script downloads [go-etherum](https://github.com/ethereum/go-ethereum) and starts a [miner](https://github.com/ethereum/go-ethereum/wiki/Mining)
