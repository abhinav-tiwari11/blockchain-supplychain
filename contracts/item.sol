pragma solidity ^0.8.0;

contract Item{
   uint ic=0;
   enum state{
       AtSupplier,
       ForSale,
       Ordered,
       shipped,
       atqualitycheck,
       returnedback,
       recievedByManufacture
   }
   struct item{
       string product_name;
       uint productId;
       address itemOwner;
       state productState;
       uint cost;
       
   }
   mapping(uint=>item) public Items;


}