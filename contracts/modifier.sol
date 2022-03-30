pragma solidity 0.8.0;

import "./item.sol";
import "./member.sol";
import "./order.sol";

contract Modifier is order {
      address public owner;
      constructor() public{
        owner = msg.sender;
    }
        modifier onlyOwner()
     {
         require(msg.sender == owner);
         _;
     }
     modifier onlyDistributor(address _address)
     {
         require(participantsId[_address].utype == user_type.supplier ,"you cannot add new product");
         _;
     }
     modifier onlyManufacturer(address _address)
     {
         require(participantsId[_address].utype == user_type.manufacturer,"you are not manufacuter");
         _;
     }
    
     modifier onlyTransporter(address _address)
     {
         require(participantsId[_address].utype == user_type.transporter);
         _;
     }
     modifier openSale(uint _ic)
     {
         require(Items[ic].productState == state.ForSale,"Item is not for sale");
         _;
     }
    //  modifier isOwner(uint _ic)
    //  {
    //      require(getOwner(_ic) == msg.sender , "you are not owner so you cannot change the state");
    //      _;
    //  }
     modifier hasMoney(uint _value ,uint _ic)
     {
         require(Items[_ic].cost <=_value, "you dont have enough money to buy the product");
         _;
     }
     modifier productowner(uint _id)
     {
         require(Items[_id].itemOwner == msg.sender ,"you are not owner of this product");
         _;
     }

}