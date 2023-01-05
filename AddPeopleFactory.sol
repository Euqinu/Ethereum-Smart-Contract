pragma solidity ^0.8.0;

import './AddPeopleSimpleLearning.sol';

contract AddPeopleFactory {

    AddPeople public addPeopleContract;

    AddPeople[] public addContractList;

    function createAddPeopleContract() public {
        // addPeopleContract = new AddPeople();
        AddPeople contract1 = new AddPeople();
        addContractList.push(contract1);
    }
}
