// hardhat.config.js

require("@nomiclabs/hardhat-waffle");
require('dotenv').config();
const { ALLTHATNODE_API_URL, INFURA_API_URL, PRIVATE_KEY, TEST_CLIENT_PRIVATE_KEY } = process.env;

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.9",
  networks: {
    goerli: {
      url: `${INFURA_API_URL}`, //`${ALLTHATNODE_API_URL}`,
      accounts: [`${PRIVATE_KEY}`, `${TEST_CLIENT_PRIVATE_KEY}`],
    }
  }
}