// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Marketplace {
    address public owner;

    struct Item {
        uint id;
        string name;
        uint price;
        address payable seller;
        bool isSold;
    }

    uint public itemCount;
    mapping(uint => Item) public items;

    event ItemListed(uint id, string name, uint price, address seller);
    event ItemPurchased(uint id, address buyer);

    constructor() {
        owner = msg.sender;
    }

    function listItem(string memory _name, uint _price) public {
        require(_price > 0, "Price must be greater than zero");
        itemCount++;
        items[itemCount] = Item(itemCount, _name, _price, payable(msg.sender), false);
        emit ItemListed(itemCount, _name, _price, msg.sender);
    }

    function buyItem(uint _id) public payable {
        Item storage item = items[_id];
        require(_id > 0 && _id <= itemCount, "Item does not exist");
        require(!item.isSold, "Item already sold");
        require(msg.value == item.price, "Incorrect amount");

        item.seller.transfer(msg.value);
        item.isSold = true;
        emit ItemPurchased(_id, msg.sender);
    }
}
