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
    
    function addNumberInAnotherContract(uint256 contractIndex, uint256 numToBeStored) public {
        AddPeople addPeopleContract = addContractList[contractIndex];
        addPeopleContract.storeNumber(numToBeStored);
    }

    function getNumber(uint256 contractIndex) public view returns(uint256){
        AddPeople addPeopleContract = addContractList[contractIndex];
        return addPeopleContract.retrieveNumber();
    }
}
