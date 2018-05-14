# innovation day token

## contract
```solidity
contract InnovationDay {
    address admin;
    string public name;
    string public symbol;
    uint price;
    mapping(bytes32 => bool) allowedCodes;
    mapping(address => uint) balances;
    mapping(address => mapping(bytes32 => bool)) usedCodes;

    modifier onlyAdmin() {require(msg.sender == admin);_;}

    constructor() public {}
    // administration
    function allowCode(string code) public onlyAdmin returns (bool success) {}
    function allowHashedCode(bytes32 codeh) public onlyAdmin returns (bool success) {}
    function addTokens(address tokenOwner, uint tokens) public onlyAdmin returns (bool success) {}
    function changePrice(uint _price) public onlyOwner {
        price = _price;
    }
    // user functions
    function buyToken() public payable costs(price) {}
    function spendToken(string code) public returns (bool success) {}
    function balanceOf(address tokenOwner) returns (uint balance) {}
}
```

