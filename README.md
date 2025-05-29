## Marketplace Solidity Smart Contract

📦 Project Overview
This is a simple Ethereum Marketplace smart contract written in Solidity (v0.8.0). It allows users to list items for sale and purchase listed items using Ether. The contract ensures secure transactions with checks on payment amounts and tracks sold items.

⚙️ Features
🛒 List Items: Sellers can list items with a name and price.

💰 Buy Items: Buyers can purchase items by sending the exact price in Ether.

🔐 Secure Transactions: Uses require statements to validate conditions like correct payment and item availability.

🔔 Events: Emits events for item listing and purchase for easy tracking.

📄 Contract Details
Contract: Marketplace
Owner: The deployer of the contract.

Item Struct:

id (uint): Unique identifier.

name (string): Name of the item.

price (uint): Price in wei.

seller (address payable): Seller's address.

isSold (bool): Sale status.

State Variables:

itemCount (uint): Total number of items listed.

items (mapping): Maps item ID to the Item.

Functions:

listItem(string _name, uint _price): List a new item with name and price.

buyItem(uint _id) payable: Purchase an item by sending exact price.

Events:

ItemListed(uint id, string name, uint price, address seller)

ItemPurchased(uint id, address buyer)

🚀 How to Use
Deploy the contract on an Ethereum-compatible blockchain.

Call listItem to add an item for sale.

From a different wallet, call buyItem with the correct item ID and send the exact Ether amount matching the item price.

Events ItemListed and ItemPurchased will be emitted to track actions.

🛠️ Installation & Testing
Use Remix IDE or Hardhat/Truffle for deployment and testing.

Interact via Web3 wallets like MetaMask.

Ensure your wallet has enough Ether for purchases.

📜 Example
solidity
Copy
Edit
// List an item
listItem("Vintage Clock", 1000000000000000000); // 1 ETH

// Buy the item (from another account)
buyItem(1) with msg.value == 1 ether;

⚖️ License
This project is licensed under the MIT License.
