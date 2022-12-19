pragma solidity ^0.5.1;

contract FamilyWill {
    uint willAmount;
    address payable owner;
    address wallet;
    bool isDead;
    mapping(address=>uint) siblings;
    address payable[] familyAddress;

    constructor() public payable{
        willAmount=msg.value;
        owner=msg.sender;
        isDead=false;
    }

    modifier isOwnerDead {
        require(isDead==true);
        _;
    }

    modifier isOwner {
        require(msg.sender==owner);
        _;
    }

    function setWillDistribution(uint amount,address payable siblingAddress) public isOwner{
        siblings[siblingAddress]=amount;
        familyAddress.push(siblingAddress);
    }

    function releaseWill() private isOwnerDead {
        for(uint i=0;i<familyAddress.length;i++){
            familyAddress[i].transfer(siblings[familyAddress[i]]);
        }
    }

    function releaseWillAmount() public{
        isDead=true;
        releaseWill();

    }
}
