pragma solidity ^0.8.0;

contract participant{
    uint pc=0;
    enum user_type{
        supplier,
        transporter,
        quality_checker,
        manufacturer
    }

    struct participant{
        string username;
        uint userId;
        user_type utype;
        address user_address;
        uint money;
    }
    mapping(uint=>participant) public participants;
    mapping(address=>participant) participantsId;
}