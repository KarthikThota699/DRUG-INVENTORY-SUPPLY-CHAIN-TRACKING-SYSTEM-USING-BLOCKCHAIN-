const UserInfoStorage = artifacts.require("UsersInfo");

module.exports = function (deployer) {
    deployer.deploy(UserInfoStorage);
}