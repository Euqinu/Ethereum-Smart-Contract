pragma solidity ^0.5.0;


contract AddPeople{

    address owner;
    constructor() public {
        owner=msg.sender;
    }
    struct Person{
        string _firstname;
        string _lastname;
    }

    modifier isBoss{
        require(msg.sender==owner);
        _;
    }

    modifier isEven{
        require(2+2==3);
        _;
    }

    mapping(uint=>Person) people;

    function addPerson(uint num,string memory firstname,string memory lastname) public isBoss isEven{
        people[num]=Person(firstname,lastname);
    }
    
    function storeNumber(uint num) public{
        favNumber=num;
    }

    function retrieveNumber() public view returns(uint)  {
        return favNumber;
    }
}
