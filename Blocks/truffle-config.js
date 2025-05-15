module.exports = {


  networks: {
   
    ganache:{
    network_id:'*',
    port:7545,
    host:'127.0.0.1',  
    gasPrice:500000,
    }
  },

  mocha: {

  },
  compilers: {
    solc: {
      version: "0.8.21",      // Fetch exact version from solc-bin (default: truffle's version)
      // docker: true,        // Use "0.5.1" you've installed locally with docker (default: false)
      settings: {          // See the solidity docs for advice about optimization and evmVersion
       optimizer: {
         enabled: true,
         runs: 200,
       },
       "viaIR":true,
       evmVersion: "byzantium"
      }
    }
  },

 };
