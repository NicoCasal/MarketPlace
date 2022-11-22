// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract MarketPlace is ReentrancyGuard {
    address payable public immutable feeAccount;
    uint public immutable feePorcent;
    uint public itemCount;

    struct Item {
        uint itemId;
        IERC721 nft;
        uint tokenId;
        uint price;
        address payable seller;
        bool sold;
    }



    mapping (uint => Item)public items;

    event Offered(
        uint itemId,
        address indexed nft,
        uint tokenId,
        uint indexed seller
    );

    event Bought(
        uint itemID,
        address indexed nft,
        uint tokenId,
        uint price,
        address seller,
        address buyer
    );



    constructor(uint _feePercent){
        feeAccount = payable(msg.sender);
        feePorcent = feePorcent;
        
    }
}
