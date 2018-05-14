pragma solidity ^0.4.23;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/InnovationDay.sol";

contract TestInnovationDay
{
    InnovationDay innovationday;
    
    function beforeEach() public {
        innovationday = new InnovationDay();
    }

    function testDeployment() public
    {
        string memory expected = "INNOVATION";
        Assert.equal(innovationday.name(),expected,"testDeployment() failed: token name should be \"innovation\"");
    }

    function testAllowCode() public
    {
        string memory code = "test";
        bytes32 hashedcode = sha256(code);
        innovationday.allowCode(code);
        Assert.equal(innovationday.allowedCode(hashedcode), true, "testAllowCode() failed");
    }

    function testAllowHashedCode() public
    {
        string memory code = "test";
        bytes32 hashedcode = sha256(code);
        innovationday.allowHashedCode(hashedcode);
        Assert.equal(innovationday.allowedCode(hashedcode), true, "testAllowCode() failed");
    }

    function testAddTokens() public
    {
        uint expected = 10;
        innovationday.addTokens(address(0), expected);
        Assert.equal(innovationday.balanceOf(address(0)), expected, "testAddTokens() failed");
    }

    function testSpendtoken() public
    {
        string memory code = "test";
        bytes32 hashedcode = sha256(code);
        innovationday.allowHashedCode(hashedcode);
        innovationday.addTokens(this, 1);
        innovationday.spendToken(hashedcode);
        Assert.equal(innovationday.balanceOf(this), 0, "testSpendToken() failed");
    }
}