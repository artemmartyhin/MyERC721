const My721token = artifacts.require("My721token");

module.exports = function(deployer){
    deployer.deploy(My721token, "My721token", "MTK", 10000);
}