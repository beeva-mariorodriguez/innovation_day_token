# innovation day token

simple contract to manage tokens at our innovation day event!

## components used
* (truffle framework)[http://truffleframework.com]
    * deploy the contract
    * run the test ethereum network
* (web3.js)[https://github.com/ethereum/web3.js] Ethereum JavaScript API
* (metamask)[https://metamask.io/] browser addon to interact with the Ethereum network from the browser

## testing the contract
* clone it!
```bash
git clone https://github.com/beeva-mariorodriguez/innovation_day_token
cd Even
```
* install truffle ``npm install -g truffle``
* launch test ethereum network in a new terminal window
```bash
truffle develop --network=development
```
* run automated tests
```bash
truffle test 
```
* deploy the contract to the test network, note the ethereum address assigned to the contract (``0x7153ccd1a20bbb2f6dc89c1024de368326ec6b4f``)
```bash
truffle migrate --network=development --reset
...
Running migration: 2_deploy_contracts.js
  Replacing InnovationDay...
  ... 0xad40b81562d389da4da2c837dbb9c423f18f7e386315211763ea98c0c3aed0d0
  InnovationDay: 0x7153ccd1a20bbb2f6dc89c1024de368326ec6b4f
```

* interact with the contract using the console
```
truffle(development)> InnovationDay.at("0x7153ccd1a20bbb2f6dc89c1024de368326ec6b4f")
```

