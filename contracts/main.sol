pragma solidity ^0.8.0;

import "./member.sol";
import "./item.sol";
import "./modifier.sol";


contract Supplychain is  Modifier{
    event itemcreated(uint upc, address _address);
    event openForSale(uint upc);
    event orderPlaced(uint upc , address _address);
    event shipped(uint upc,address _address);
    event checked(uint upc);
    event received(uint upc, address _address);
   

   function addSupplier(string memory _uname) public{
       participant memory  newParticipant;
       newParticipant.username =_uname;
       newParticipant.userId = pc;
       newParticipant.utype = user_type.supplier;
       newParticipant.user_address =msg.sender;
       newParticipant.money = 0;
       participants[pc]=newParticipant;
       participantsId[msg.sender]=newParticipant;
       pc=pc+1;

   }
   function addtransporter(string memory _uname) public {
        participant memory newParticipant ;
        newParticipant.username =_uname;
        newParticipant.userId = pc;
        newParticipant.money = 0;
        newParticipant.utype= user_type.transporter;
        newParticipant.user_address = msg.sender;
        participants[pc]=newParticipant;
        participantsId[msg.sender]=newParticipant;
        pc=pc+1;

    }
    function addManufacturer(string memory _uname) public {
        participant memory newParticipant ;
        newParticipant.username =_uname;
        newParticipant.userId = pc;
        newParticipant.money = 0;
        newParticipant.utype= user_type.manufacturer;
        newParticipant.user_address = msg.sender;
        participants[pc]=newParticipant;
        participantsId[msg.sender]=newParticipant;
        pc=pc+1;

    }
    function addItem(string memory _product_name , uint cost) public onlyDistributor(msg.sender)
    {
        item memory newItem;
        newItem.product_name =_product_name;
        newItem.productId = ic;
        newItem.itemOwner = msg.sender;
        newItem.productState = state.AtSupplier;
        Items[ic]=newItem;
        emit itemcreated(ic ,msg.sender);
        ic=ic+1;

    }
    function avaliableforsale(uint _id) public productowner(_id)
    {
        Items[_id].productState = state.ForSale;
        emit openForSale(_id);
    }
    function order(uint _id) public hasMoney(0,0)
    {  
       Order memory newOrder;
       newOrder.buyer = msg.sender;
       newOrder.orderId = on;
       newOrder.order_state = Order_state.order_placed;
       newOrder.orderItem = Items[_id];
       orders[on]=newOrder;
       emit orderPlaced(_id,msg.sender);
       on=on+1;
    }
    
    function ship_product(uint _id,address _transporter_address) public productowner(_id)
    {
       Items[_id].productState = state.shipped;
       emit shipped(_id,_transporter_address);
    }

    function productDetail(uint _id) public view returns (item memory)
    {
        return Items[_id];
    }
    function currentState(uint _id)public view returns(state )
    {
        return Items[_id].productState;
    }

    function personDetail(uint _id) public view returns(participant memory)
    {
        return participants[_id];
    }


}