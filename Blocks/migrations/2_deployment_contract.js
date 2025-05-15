const deploymentProcess = artifacts.require("ProductInfo");

module.exports = function (deployer) {
    deployer.deploy(deploymentProcess);
}