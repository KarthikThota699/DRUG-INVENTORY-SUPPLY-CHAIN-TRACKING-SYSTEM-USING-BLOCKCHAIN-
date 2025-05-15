const deploymentSer = artifacts.require("PurchaseHistory")

module.exports=function (deployer){
    deployer.deploy(deploymentSer)
}