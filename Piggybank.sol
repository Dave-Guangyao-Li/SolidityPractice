// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.10;

contract PiggyBank {
    event Deposit(uint256 amount);
    event Withdraw(uint256 amount);

    address public owner = msg.sender;

    receive() external payable {
        emit Deposit(msg.value);
    }

    function withdraw() external {
        //only owner can withdraw ether
        require(msg.sender == owner, "Not Owner");
        emit Withdraw(address(this).balance);
        selfdestruct(payable(msg.sender));
    }
}
