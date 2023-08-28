// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

abstract contract CBDC {
    mapping(bytes32 => uint256) public balanceOf;
    
    function transfer(bytes32 from, bytes32 fromUserId, bytes32 to, uint256 amount) public {
        require(from == recoverSender(), "Invalid sender");
        balanceOf[to] += amount;
        balanceOf[from] -= amount;
    }


    function recoverSender() virtual internal returns (bytes32);
}
