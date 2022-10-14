// SPDX-License-Identifier: MIT

// https://www.youtube.com/watch?v=Q-wRG7pngn0&list=PLO5VPQH6OWdVQwpQfw9rZ67O6Pjfo6q-p&index=22
// declare a mapping (simple and nested ) and get set delete mapping
// ['alice', 'bob', 'charlie']
// {'alice':true, 'bob':true, 'charlie':true}

pragma solidity ^0.8.7;

contract Mapping {
    mapping(address => uint256) public balances;
    mapping(address => mapping(address => bool)) isFriend;

    function examples() external {
        balances[msg.sender] = 123;
        uint256 bal = balances[msg.sender];
        uint256 bal2 = balances[address(1)]; //0

        balances[msg.sender] += 456; //123+456 = 579

        delete balances[msg.sender]; //0

        isFriend[msg.sender][address(this)] = true;
    }
}
