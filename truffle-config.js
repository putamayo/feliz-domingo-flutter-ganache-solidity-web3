module.exports = {
  networks: {

     development: {
       host: "192.168.2.6",     // Localhost (default: none)
       port:  7545,            // Standard Ethereum port (default: none)
       network_id: "*",       // Any network (default: none)
     },
     advanced: {
       websockets: true,
       },
     },
  contracts_build_directory: "./src/abis/"
  compilers: {
    solc: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  };



    // advanced: {
    // port: 8777,             // Custom port
    // network_id: 1342,       // Custom network
    // gas: 8500000,           // Gas sent with each transaction (default: ~6700000)
    // gasPrice: 20000000000,  // 20 gwei (in wei) (default: 100 gwei)
    // from: <address>,        // Account to send txs from (default: accounts[0])
    // websocket: true        // Enable EventEmitter interface for web3 (default: false)
    // },
    // Useful for deploying to a public network.
