pragma solidity ^0.4.23;

library SafeMath
{
    function add(uint a, uint b) internal pure returns (uint c)
    {
        c = a + b;
        require(c >= a);
    }
    function sub(uint a, uint b) internal pure returns (uint c)
    {
        require(b <= a);
        c = a - b;
    }
    function mul(uint a, uint b) internal pure returns (uint c)
    {
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function div(uint a, uint b) internal pure returns (uint c)
    {
        require(b > 0);
        c = a / b;
    }
}

contract InnovationDay
{
    address admin;
    string public name;
    string public symbol;
    uint256 price;
    uint256 initialValue;
    mapping(address => bool) registered;
    mapping(address => uint) balances;
    mapping(address => mapping(address => bool)) expenses;

    using SafeMath for uint;

    modifier onlyAdmin()
    {
        require(msg.sender == admin);
        _;
    }

    constructor() public
    {
        admin = msg.sender;
        name = "INNOVATION";
        symbol = "INN";
        initialValue = 10;
        //price = 1 ether;
        emit ContractDeployed();
    }

    // administration
//    function allowCode(string code) public onlyAdmin returns (bool success)
//    {
//        allowedCodes[sha256(code)] = true;
//        return true;
//    }

//    function allowHashedCode(bytes32 hashedcode) public onlyAdmin returns (bool success)
//    {
//        allowedCodes[hashedcode] = true;
//        return true;
//    }

//    function allowedCode(bytes32 hashedcode) public view returns (bool success)
//    {
//        return allowedCodes[hashedcode];
//    }

    function addTokens(address tokenOwner, uint tokens) public onlyAdmin returns (bool success)
    {
        balances[tokenOwner] = balances[tokenOwner].add(tokens);
        return true;
    }

    function setPrice(uint256 _price) public onlyAdmin
    {
        // One Ether is 1000000000000000000 wei
        price = _price;
    }

    function setPriceInEther(uint256 _price) public onlyAdmin
    {
        // One Ether is 1000000000000000000 wei
        price = _price * 1 ether;
    }

    // user functions
    function buyToken() public payable returns(uint amount)
    {
        amount = msg.value.div(price);
        balances[msg.sender] = balances[msg.sender].add(amount);
        return amount;
    }

//    function spendToken(address standAddress, uint amount) public returns (bool success)
//    {
//        require(balances[msg.sender]>0);
//        //require(allowedCodes[hashedcode]);
//        require(expenses[msg.sender][standAddress] == false);
//        expenses[msg.sender][standAddress] = true;
//        balances[msg.sender] = balances[msg.sender].sub(amount);
//        balances[standAddress] = balances[standAddress].add(amount);
//        emit TokenSpent("");
//        return true;
//    }

    function spendToken(address standAddress, uint amount,  string data) public returns (bool success)
    {
        require(balances[msg.sender]>0);
        //require(allowedCodes[hashedcode]);
        //require doesnt emit events to web layer.
        //require(expenses[msg.sender][standAddress] == false);
        if(expenses[msg.sender][standAddress] == false){
            expenses[msg.sender][standAddress] = true;
            balances[msg.sender] = balances[msg.sender].sub(amount);
            balances[standAddress] = balances[standAddress].add(amount);
            emit TokenSpent(data,true);
        }else{
            emit TokenSpent(data,false);
        }
        return true;
    }

    function expenseByUser(address standAddress) public view returns (bool used)
    {
        return expenses[msg.sender][standAddress];
    }

    function balanceOf(address tokenOwner) public view returns (uint balance)
    {
        return balances[tokenOwner];
    }


    function autoclaim(string nick) public {
        require(registered[msg.sender]==false);
        registered[msg.sender]=true;
        balances[msg.sender]=initialValue;
        emit initialClaim(msg.sender, nick);
    }


    function isRegistered(address addr) public view returns (bool userRegistered){
        return registered[addr];
    }




    event ContractDeployed();
    event TokenSpent(string data, bool success);
    event initialClaim(address addr, string nick);
}
