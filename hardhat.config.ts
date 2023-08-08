import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import "hardhat-circom";
import { NetworkUserConfig } from "hardhat/types";
import { resolve } from "path";

// circuits
import circuits = require('./circuits.config.json')

// set env var to the root of the project
process.env.BASE_PATH = __dirname;

// tasks
import "./tasks/newcircuit"

const mumbaiConfig: NetworkUserConfig = {
  url: "https://rpc-mumbai.maticvigil.com", // Mumbai network RPC URL
  accounts: [ // Specify accounts as an array of private keys
    "5de4111afa1a4b94908f83103eb1f1706367c2e68ca870fc3fb9a804cdab365a",
    // Add more private keys if needed
  ],
};

const config: HardhatUserConfig = {
  defaultNetwork: "hardhat", // Set "hardhat" as the default network
  networks: {
    hardhat: {},
    mumbai: mumbaiConfig, // Add Mumbai network configuration
  },
  solidity: {
    compilers: [
      {
        version: "0.8.17",
      },
      {
        version: "0.6.11",
      },
    ],
  },
  circom: {
    // (optional) Base path for input files, defaults to `./circuits/`
    inputBasePath: "./circuits",
    // (required) The final ptau file, relative to inputBasePath, from a Phase 1 ceremony
    ptau: "powersOfTau28_hez_final_12.ptau",
    // (required) Each object in this array refers to a separate circuit
    circuits: JSON.parse(JSON.stringify(circuits)),
  },
  ethers: {
    // Add Mumbai network configuration for ethers.js
    networks: {
      mumbai: mumbaiConfig,
    },
  },
};

export default config;

