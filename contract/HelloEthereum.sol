pragma solidity ^0.4.18;

contract HelloEthereum {
    string public msg1;
    string private msg2;
    address public owner;
    uint8 public counter;

    constructor(string _msg1) public{
        msg1 = _msg1;

        owner = msg.sender;

        counter = 0;
    }

    function setMsg2(string _msg2) public {
        require(owner == msg.sender);
        msg2 = _msg2;

    }

    function getMsg2() view public returns (string){
        return msg2;
    }

    function setCounter() public{
        for (uint8 i = 0; i < 3; i++) {
            counter++;
        }
    }
}