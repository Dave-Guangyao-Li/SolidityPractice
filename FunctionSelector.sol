// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.10;

contract FunctionSelector {
    // get first 4 bytes of func, the function selector
    function getSelector(string calldata _func) external pure returns (bytes4) {
        return bytes4(keccak256(bytes(_func)));
        // put into getSelector "transfer(address,uint256)" should be equal to 0xa9059cbb
    }
}

contract Receiver {
    event Log(bytes data);

    function transfer(address _to, uint256 _amount) external {
        emit Log(msg.data);
        // in transaction log:
        // 0xa9059cbb first 4 bytes : encode the  function to call
        // the rest are parameters passed to func
        // 0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
        // 4000000000000000000000000000000000000000000000000000000000000000b : 11
    }
}
