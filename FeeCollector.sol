// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FeeCollector { // 0x70bBCFe4Df86232cD7bEd620dBc1A8AE804923a9
    address public owner;
    uint256 public balance;

    constructor() {
        owner = msg.sender; // msg.sender is public address
    }

    receive() payable external {
        balance += msg.value;
    }

    function withdraw(uint amount, address payable destAddr) public {
        require(msg.sender == owner, "Only owner can withdraw");
        require(amount <= balance, "Insufficient funds");

        destAddr.transfer(amount);
        balance -= amount;
    }
}