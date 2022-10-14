// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.10;

// deleting a contract from blockchain

// selfdestruct
// - delete contract, then cannot call function inside
contract Kill {
    constructor() payable {}

    function kill() external {
        selfdestruct(payable(msg.sender));
    }

    function testCall() external pure returns (uint256) {
        return 123;
    }
}

// - force send ether to any address. force send all ether of kill contract to helper contract
// getBalance() check > 0
contract Helper {
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function kill(Kill _kill) external {
        _kill.kill();
    }
}
