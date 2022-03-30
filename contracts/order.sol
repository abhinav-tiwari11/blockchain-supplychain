pragma solidity ^0.8.0 ;

import "./item.sol";
import "./member.sol";

contract order is Item,participant{
    uint on =0 ;
    enum Order_state{
       order_placed,
       order_cancelled,
       order_delivered
   }

   struct Order{
      uint orderId ;
      item orderItem;
      address buyer ;
      Order_state order_state;

   }
   mapping(uint=>Order) orders;


}