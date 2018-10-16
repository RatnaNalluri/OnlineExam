var OnlineExam = artifacts.require("./OnlineExam.sol");

module.exports = function(deployer) {
  deployer.deploy(OnlineExam);
};
