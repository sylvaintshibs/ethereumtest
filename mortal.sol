pragma solidity ^0.4.24;
contract mortal {
    address owner;
    
    constructor() public{
        owner = msg.sender;
    }
    
    modifier onlyOwner(){
     if(owner == msg.sender){
         _;
     }   else {
         revert();
     }
    }
    
    function kill() public onlyOwner{
        if(msg.sender == owner){
            selfdestruct(owner);
        } else{
            revert();
        }
    }
}