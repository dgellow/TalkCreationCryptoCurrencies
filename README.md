# OptioCoin

1. Install [ethereum wallet]()
1. Install [ethereum cli](https://www.ethereum.org/cli)

## Setup private test network

Sources:
- https://github.com/ethereum/go-ethereum/wiki/Private-network
- https://www.ethereum.org/cli#connecting-to-a-private-test-net
- https://medium.com/@andresilva/step-by-step-guide-to-deploy-your-first-ethereum-contract-in-a-private-network-4dd9d333f112
- https://www.ethereum.org/greeter

### The easy way

In a console:

```
$ geth --datadir ~/.ethereum_private --dev
```

In a separate console:

```
$ geth --dev attach ipc:/Users/sam/.ethereum_private/geth.ipc
```

Create account from the geth console:

```
> personal.newAccount("password")
```

Start Ethereum Wallet using the test network:

```
$ /Applications/Ethereum\ Wallet.app/Contents/MacOS/Ethereum\ Wallet --rpc /Users/sam/.ethereum_private/geth.ipc
```

## Smart contract

Sources:
- https://www.ethereum.org/token
- https://medium.com/etherereum-salon/hello-ethereum-solan-contract-4643118a6119
- https://www.ethereum.org/greeter

### Setup environment

Install solidity compiler

```
$ npm install -g solc
```

Install truffle framework

```
$ npm install -g truffle
```

Init truffle project

```
$ truffle init
```

### Create contract

```
$ truffle create contract HelloOptioCoin
```

### Create transaction, needed for miners in dev mode

From a geth console

```
> var sender = eth.accounts[0];
> var receiver = eth.accounts[1];
> var amount = web3.toWei(0.01, "ether")
> eth.sendTransaction({from: sender, to: receiver, value: amount})
```

### Get ABI from contract source

```
$ solcjs --abi contracts/OptioCoin.sol
$ cat contracts_OptioCoin_sol_MyToken.abi
```

### Load contract

```
> var contractAddress = "0xDF9dfB80d192622885f65296890fAe1F1fe82370"
> var contractAbi = [{"constant":true,"inputs":[{"name":"","type":"address"}],"name":"balanceOf","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"to","type":"address"},{"name":"value","type":"uint256"}],"name":"transfer","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"inputs":[{"name":"initialSupply","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"}]
> var contract = web3.eth.contract(contractAbi).at(contractAddress)
```

###

###

## Messing around

### Generate Genesis block

Decide for a network test id.

Create the file `genesis.json` with the content:

```json
{
    "config": {
        "chainId": <NETWORK_TEST_ID>,
        "homesteadBlock": 0,
        "eip155Block": 0,
        "eip158Block": 0
    },
    "difficulty": "200000000",
    "gasLimit": "2100000",
    "alloc": {
        "7df9a875a174b3bc565e6424a0050ebc1b2d1d82": { "balance": "300000" },
        "f41c74c9ae680c1aa78f42e5647a62f353b7bdde": { "balance": "400000" }
    }
}
```

### Initialize private network

Source: https://www.ethereum.org/cli#connecting-to-a-private-test-net

```
# Create a database that uses the genesis block
$ geth --datadir ~/.ethereum_private init genesis.json

# Start a console connected to the private network
$ geth --datadir ~/.ethereum_private --networkid 1234 console
```


### Run a private miner

```
$ geth --datadir ~/.ethereum_private --networkid 1827369 --mine --minerthreads=1 --etherbase=0x0000000000000000000000000000000000000000
```
