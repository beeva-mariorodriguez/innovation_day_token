var InnovationDay = artifacts.require("InnovationDay");
module.exports = function(deployer, network) {
    if (network == "development") {
        deployer.deploy(InnovationDay, {from:"0x627306090abab3a6e1400e9345bc60c78a8bef57"});
    }
    if (network == "live") {
        deployer.deploy(InnovationDay, {from:"0810ce69e1ce41c0d68e4baa09391da1c2392d49"});
    }
};

