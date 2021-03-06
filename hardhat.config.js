require("@nomiclabs/hardhat-waffle");
require('dotenv').config()

const defaultNetwork = 'localhost'

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.12",
  defaultNetwork,
  networks: {
    localhost: {
      url: 'http://localhost:8545',
      gas: 2100000,
      gasPrice: 8000000000,
    },
    hardhat: {
    },
    rinkeby: {
      url: `https://rinkeby.infura.io/v3/${process.env.INFURA_PROJECT_ID}`,
      accounts: [process.env.ACCOUNT_PRIVATE_KEY]
    }
  }
};
