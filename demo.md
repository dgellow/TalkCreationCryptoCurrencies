## Setup private network

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
